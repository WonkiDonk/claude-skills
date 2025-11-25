#!/usr/bin/env bash

# Scaffold script for creating new Claude Skills
# Usage: ./new-skill.sh <skill-name> [description]

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if skill name is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Skill name is required${NC}"
    echo ""
    echo "Usage: ./new-skill.sh <skill-name> [description]"
    echo ""
    echo "Example:"
    echo "  ./new-skill.sh my-awesome-skill \"A skill that does awesome things\""
    echo ""
    exit 1
fi

SKILL_NAME="$1"
SKILL_DESCRIPTION="${2:-A new Claude skill}"

# Validate skill name (lowercase, hyphens only)
if [[ ! "$SKILL_NAME" =~ ^[a-z0-9-]+$ ]]; then
    echo -e "${RED}Error: Skill name must contain only lowercase letters, numbers, and hyphens${NC}"
    exit 1
fi

# Check if skill directory already exists
if [ -d "$SKILL_NAME" ]; then
    echo -e "${RED}Error: Skill directory '$SKILL_NAME' already exists${NC}"
    exit 1
fi

echo -e "${BLUE}Creating new Claude Skill: ${SKILL_NAME}${NC}"
echo ""

# Create skill directory structure
mkdir -p "$SKILL_NAME/assets"

# Create SKILL.md template
cat > "$SKILL_NAME/SKILL.md" <<EOF
---
name: ${SKILL_NAME}
description: ${SKILL_DESCRIPTION}
---

# ${SKILL_NAME} Skill

## Tags

- tag1
- tag2
- tag3

## Overview

[Provide a brief overview of what this skill does and when it should be used]

## When to Use This Skill

- [Scenario 1]
- [Scenario 2]
- [Scenario 3]

## Key Information

### Section 1

[Add relevant information, guidelines, or data that Claude should reference]

### Section 2

[Add more sections as needed]

## Examples

### Example 1: [Scenario Name]

[Describe how to use this skill in a specific scenario]

### Example 2: [Another Scenario]

[Provide another example]

## Best Practices

- [Best practice 1]
- [Best practice 2]
- [Best practice 3]

## Important Notes

- [Important note 1]
- [Important note 2]

## Resources

- [Link to relevant documentation]
- [Link to related resources]

---

_Created: $(date +"%Y-%m-%d")_
EOF

# Create README for the assets folder
cat > "$SKILL_NAME/assets/README.md" <<EOF
# Assets Directory

Place any supporting files for this skill here:

- Images (PNG, JPG, SVG)
- Documents (PDF, DOCX)
- Data files (CSV, JSON)
- Reference materials

These files will be included when the skill is packaged and uploaded to Claude.
EOF

echo -e "${GREEN}✓ Created skill structure:${NC}"
echo "  $SKILL_NAME/"
echo "  ├── SKILL.md"
echo "  └── assets/"
echo "      └── README.md"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Edit ${SKILL_NAME}/SKILL.md with your skill content"
echo "  2. Add any supporting files to ${SKILL_NAME}/assets/"
echo "  3. Run ./build.sh to package your skill"
echo ""
echo -e "${GREEN}Happy skill building! 🎉${NC}"
