#!/usr/bin/env bash

# Build script for Claude Skills
# This script compresses each skill folder into a zip file for upload to Claude

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Building Claude Skills...${NC}"

# Create build directory if it doesn't exist
BUILD_DIR="./build"
mkdir -p "$BUILD_DIR"

# Clean previous builds
echo -e "${BLUE}Cleaning previous builds...${NC}"
rm -f "$BUILD_DIR"/*.zip

# Counter for skills built
skills_built=0

# Find all directories containing SKILL.md (excluding hidden directories and build folder)
while IFS= read -r -d '' skill_path; do
    # Get the parent directory (skill folder)
    skill_dir=$(dirname "$skill_path")
    # Get the directory name (skill name)
    skill_name=$(basename "$skill_dir")

    echo -e "${GREEN}Building skill: ${skill_name}${NC}"

    # Create zip file containing the entire skill directory
    # Using zip with -r for recursive and -q for quiet mode
    zip -rq "$BUILD_DIR/${skill_name}.zip" "$skill_name" -x "*.DS_Store" -x "__MACOSX/*"

    echo -e "  ✓ Created ${skill_name}.zip"
    ((skills_built++))

done < <(find . -maxdepth 2 -name "SKILL.md" -not -path "./build/*" -not -path "./.git/*" -print0)

echo ""
echo -e "${GREEN}✓ Build complete!${NC}"
echo -e "  ${skills_built} skill(s) compressed to ${BUILD_DIR}/"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Navigate to ${BUILD_DIR}/"
echo "  2. Upload the .zip files to Claude"
echo ""
