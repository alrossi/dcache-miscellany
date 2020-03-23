#!/bin/bash

LAST=

#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Text read from file: $line"
    if [ $LAST == $line ]; then
        continue;
    fi
    echo $line >> files
    LAST=$line
done < "$1"

