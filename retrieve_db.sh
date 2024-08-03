#!/bin/bash

# Define the source 
SOURCE="/Users/philellsworth/Library/Application Support/Knowledge/knowledgeC.db"
# knowledgeC.db is a db on mac that contains a large amount of information about applicaiton usage


# Define the destination directory (current directory)
DEST_DIR="."

# Use rsync to sync the file from source to destination
rsync -avhP "$SOURCE" "$DEST_DIR"