#!/bin/sh

# Check if a post-title was passed
if [ -z "$1" ]; then
    echo "Usage: $0 <post-title>"
        exit 1
fi

# Get the current date in YYYY-MM-DD format
DATE=$(date -I)

# Create a filename with the date and post-title
FILENAME="docs/_posts/${DATE}_$1.md"

# Check if the file already exists
if [ -e "$FILENAME" ]; then
    echo "Error: File '$FILENAME' already exists."
        exit 1
fi

# Generate the file and add the jekyll header with date and title
cat << EOF > "$FILENAME"
---
layout: post
title:  "$1"
date:   ${DATE}
categories:
---
EOF

# Output the name of the created file
echo "File created: $FILENAME"

