#!/bin/bash

# === Configuration ===
SOURCE_DIR="./rules"
DEST_DIR="./rule_changes"
TRACK_FILE="./.last_file_change_sync"

# === Ensure destination exists and is clean ===
if [ -d "$DEST_DIR" ]; then
    echo "Cleaning existing destination directory: $DEST_DIR"
    rm -rf "$DEST_DIR"/*
else
    echo "Creating destination directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

# === First-time setup: create tracking file if it doesn't exist ===
if [ ! -f "$TRACK_FILE" ]; then
    echo "Tracking file not found. Creating initial sync record..."
    date -u +"%Y-%m-%d %H:%M:%S" > "$TRACK_FILE"
fi

# === Get last sync time ===
LAST_SYNC=$(cat "$TRACK_FILE")
echo "Last sync was at: $LAST_SYNC"

# === Find modified or newly created files since last sync ===
CHANGED_FILES=$(find "$SOURCE_DIR" -type f -newermt "$LAST_SYNC")

if [ -z "$CHANGED_FILES" ]; then
    echo "No new or modified files to copy."
else
    echo "Copying changed files to $DEST_DIR:"
    while IFS= read -r file; do
        echo " - $file"
        # Preserve directory structure
        TARGET="$DEST_DIR/${file#$SOURCE_DIR/}"
        mkdir -p "$(dirname "$TARGET")"
        cp "$file" "$TARGET"
    done <<< "$CHANGED_FILES"
fi

# === Update last sync time ===
date -u +"%Y-%m-%d %H:%M:%S" > "$TRACK_FILE"
echo "Sync complete. Updated sync timestamp."