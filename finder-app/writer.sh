#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the parent directory if it does not exist
parent_dir=$(dirname "$writefile")

if ! mkdir -p "$parent_dir"; then
    echo "Error: Could not create directory '$parent_dir'."
    exit 1
fi

# Write the string to the file, overwriting existing content
if ! printf '%s' "$writestr" > "$writefile"; then
    echo "Error: Could not write to file '$writefile'."
    exit 1
fi

exit 0