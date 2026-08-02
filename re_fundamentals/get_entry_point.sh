#!/bin/bash

if [ -f "./messages.sh" ]; then
    source ./messages.sh
else
    echo "Error: messages.sh file not found!"
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <elf_file>"
    exit 1
fi

file_name="$1"

if [ ! -f "$file_name" ]; then
    echo "Error: File '$file_name' does not exist."
    exit 1
fi

if ! file "$file_name" | grep -q "ELF"; then
    echo "Error: File '$file_name' is not a valid ELF file."
    exit 1
fi

readelf_output=$(readelf -h "$file_name")

magic_number=$(echo "$readelf_output" | grep "Magic:" | sed 's/^[ \t]*Magic:[ \t]*//' | xargs)

class=$(echo "$readelf_output" | grep "Class:" | awk '{print $2}')

byte_order=$(echo "$readelf_output" | grep "Data:" | awk -F', ' '{print $2}')

entry_point_address=$(echo "$readelf_output" | grep "Entry point address:" | awk '{print $4}')

display_elf_header_info
