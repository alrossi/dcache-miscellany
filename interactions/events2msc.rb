#!/usr/bin/env ruby

require 'rubygems'
require 'shellwords'
require 'socket'
require 'optparse'
require 'ostruct'
require 'time'

# Process command line
def OptionParser.parse(args)
  options = OpenStruct.new
  options.host = Socket.gethostname
  options.sort = false
  options.session = false
  options.rpc = false
  options.time = false;

  parser = OptionParser.new do |opts|
    opts.banner = "Usage: #{$0} [options]"     
    
    opts.on("-H", "--host HOST", "Host name") do |value|
      options.host = value
    end

    opts.on("-o", "--order", "Sort according to cell type") do |value|
      options.sort = value
    end

    opts.on("-s", "--session", "Add session markers") do |value|
      options.session = value
    end

    opts.on("-r", "--rpc", "Show RPC") do |value|
      options.rpc = value
    end

    opts.on("--hscale SCALE", "Horizontal scale factor") do |value|
      options.hscale = value
    end

    opts.on("-t", "--time", "Include time stamps") do |value|
      options.time = value
    end

    opts.on("-h", "--help", "Show this message") do |value|
      puts parser
      exit
    end
  end
 
  parser.parse!(args)

  options
end

@options = OptionParser.parse(ARGV)

# Parse input
events = []
ARGF.each do |line|
  words = Shellwords.shellwords(line)
  event = Hash[words.map{ |s| s.split('=', 2) }]
  if event['event'] == 'org.dcache.cells.send.begin' then
    events << event
  end
end

# Extract cell names
def cleanPath(path)
  path.gsub("-<unknown>", "").gsub("-Unknown", "").gsub("-#{@options.host}","").gsub(/\*@[^:]*:/, "")
end

def source(event)
  if cleanPath(event['destination']) =~ /\[.*?([^:@]*)[^:]*:>.*\]/ then
    # Last cell before destination
    "\"#{$1}\""
  elsif cleanPath(event['source']) =~ /\[.*>([^:@]*).*\]/ then
    # Current source cell
    "\"#{$1}\""
  elsif event['source'] == '[UNKNOWN]' then
    "\"broadcast\""
  else
    event['source']
  end
end

def destination(event)
  path = cleanPath(event['destination'])
  if path =~ /\[.*>([^:@]*).*\]/ then
    # Current destination cell
    "\"#{$1}\""
  else
    event['destination']
  end
end

def message(event)
  event['message'].sub(/(Message|Msg)$/,"").sub(/^(PoolMgr|PoolManager|Door|Pnfs)/, "")
end

entities = events.map do |event| 
  [source(event), destination(event)]
end.flatten.compact.uniq

if @options.sort then
  entities = entities.sort_by do |name|
    case name
    when /SRM/ then 0
    when /LoginBroker/ then 1
    when /GFTP.*/ then 2
    when /FTP.*/ then 2
    when /KFTP.*/ then 2
    when /DCap.*/ then 2
    when /Xrootd.*/ then 2
    when /WebDAV.*/ then 2
    when /gPlazma/ then 3
    when /PinManager/ then 4
    when /SrmSpaceManager/ then 5
    when /PoolManager/ then 6
    when /PnfsManager/ then 7
    when /pool_.*/ then 8
    when /broadcast/ then 9
    when /replicaManager/ then 10
    when /billing/ then 15
    else 20
    end
  end
end

if @options.time then
  entities << "Time"
end

# Generate MSC
puts "msc {"
if @options.hscale
  puts "  hscale = \"#{@options.hscale}\";";
end
puts
puts "  #{entities.join(", ")};"
puts 

session = ''
rpc = Hash[]
start = Time.parse(events.first['ts']) unless events.empty?

events.each do |event|
  if @options.session and event['session'] != session then
    session = event['session']
    puts "  --- [label=\"#{session}\",textcolour=\"gray\",linecolour=\"gray\"];"
  end

  if @options.rpc then
    case event['mode']
    when "blocking","callback"
      type = "=>"
      rpc[event['uoid']] = event
    else
      if rpc.has_key?(event['lastuoid']) then
        type = ">>"
      else
        type = "->"
      end
    end
  else
    type = "->"
  end

  if @options.time 
    lastuoid = event['lastuoid']
    ts = Time.parse(event['ts'])
    abs = ts - start
    rel = rpc.has_key?(lastuoid) ? ts - Time.parse(rpc[lastuoid]['ts']) : nil
    printf("  %s%s%s [label=\"%s\"], Time note Time [label=\"%.1fms\"];\n",
           source(event), type, destination(event),
           message(event) + (rel ? sprintf(" (%.1fms)", rel * 1000) : ""),
           abs * 1000)
  else
    puts "  #{source(event)}#{type}#{destination(event)} [label=\"#{message(event)}\"];"
  end 
end

puts "}"
