#!/bin/bash
set -e

OUTPUT_DIR="final"
CONCEPTS_DIR="concepts"

# Source files
LIGHTNING="$CONCEPTS_DIR/logo-concept-07-lightning.png"
ARROW="$CONCEPTS_DIR/logo-concept-11-arrow.png"

echo "=== Starting Logo Processing Pipeline ==="

# Create output directories
mkdir -p "$OUTPUT_DIR"

# Define sizes
FAVICON_16=16
FAVICON_32=32
FAVICON_64=64
FAVICON_512=512
EXPORT_SIZE=1024
SQUARE_SIZE=1024

echo "Step 1: Analyzing and cropping icon regions..."

# For Lightning-B concept: crop icon region (approximate from visual analysis)
# The icon is in the upper portion, roughly 1000x1000 area
convert "$LIGHTNING" -crop 1200x1200+200+150 +repage "$OUTPUT_DIR/lightning-b-icon-source.png"

# For Arrow-beams concept: crop icon region  
convert "$ARROW" -crop 1200x1200+200+150 +repage "$OUTPUT_DIR/arrow-beams-icon-source.png"

# Crop wordmark-only regions (lower portion)
convert "$LIGHTNING" -crop 2000x400+400+1100 +repage "$OUTPUT_DIR/lightning-b-wordmark-source.png"
convert "$ARROW" -crop 2000x400+400+1100 +repage "$OUTPUT_DIR/arrow-beams-wordmark-source.png"

echo "Step 2: Creating layout variations..."

# ========== LIGHTNING-B CONCEPT ==========

echo "  Processing Lightning-B layouts..."

# F1: Layout variations

# Icon-only (square, for social avatars)
convert "$OUTPUT_DIR/lightning-b-icon-source.png" -resize ${SQUARE_SIZE}x${SQUARE_SIZE} -background transparent -gravity center -extent ${SQUARE_SIZE}x${SQUARE_SIZE} "$OUTPUT_DIR/lightning-b-icononly-color.png"

# Stacked version (icon on top of wordmark)
convert "$OUTPUT_DIR/lightning-b-icon-source.png" -resize 600x600 \
  "$OUTPUT_DIR/lightning-b-wordmark-source.png" -resize 800x200 \
  -background transparent -gravity center \
  ( -clone 0 -clone 1 -append ) -delete 0,1 \
  -resize 1024x1024 -extent 1024x1024 \
  "$OUTPUT_DIR/lightning-b-stacked-pinkbeam-color.png"

# Horizontal lockup (icon left, wordmark right)
convert "$OUTPUT_DIR/lightning-b-icon-source.png" -resize 300x300 \
  "$OUTPUT_DIR/lightning-b-wordmark-source.png" -resize 700x150 \
  -background transparent -gravity center \
  ( -clone 0 -clone 1 +append ) -delete 0,1 \
  -resize 1024x512 -extent 1024x512 \
  "$OUTPUT_DIR/lightning-b-horizontal-pinkbeam-color.png"

# Square format (centered stacked for avatars)
convert "$OUTPUT_DIR/lightning-b-icon-source.png" -resize 512x512 \
  "$OUTPUT_DIR/lightning-b-wordmark-source.png" -resize 400x100 \
  -background transparent -gravity center \
  ( -clone 0 -clone 1 -append ) -delete 0,1 \
  -resize 1024x1024 -extent 1024x1024 \
  "$OUTPUT_DIR/lightning-b-square-pinkbeam-color.png"

echo "    - Color variations complete"
