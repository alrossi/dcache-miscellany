#!/usr/bin/env ruby

require 'shellwords'
require 'socket'

events = []
ARGF.each do |line|
  words = Shellwords.shellwords(line)
  event = Hash[words.map{ |s| s.split('=', 2) }]
  if event['event'] == 'org.dcache.cells.send.begin' then
    events << event
  end
end

@hostname = Socket.gethostname

def cleanPath(path)
  path.gsub("-<unknown>", "").gsub("-#{@hostname}","")
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
  event['message'].sub(/(Message|Msg)$/,"").sub(/^(PoolMgr|Door|Pnfs)/, "")
end

entities = events.map do |event| 
  [source(event), destination(event)]
end.flatten.compact

puts "msc {"
puts "  #{entities.uniq.join(", ")};"
puts 

events.each do |event|
  puts "  #{source(event)}->#{destination(event)} [label=\"#{message(event)}\"];"
end

puts "}"
