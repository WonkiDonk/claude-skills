# Claude Skills Repository

A collection of reusable Claude Skills for enhancing Claude's capabilities with domain-specific knowledge and guidelines.

## What are Claude Skills?

Claude Skills are packages of specialized knowledge, guidelines, and reference materials that you can upload to Claude to enhance its capabilities for specific domains or tasks. Each skill is a self-contained folder with a `SKILL.md` file and optional assets.

## Repository Structure

```
claude-skills/
├── build.sh              # Script to package skills for upload
├── new-skill.sh          # Script to scaffold new skills
├── build/                # Generated skill packages (gitignored)
└── [skill-name]/         # Individual skill folders
    ├── SKILL.md          # Skill content and metadata
    └── assets/           # Supporting files (images, docs, etc.)
```

## Quick Start

### 1. Enable Script Execution

Before using the scripts, make them executable:

```bash
chmod +x build.sh new-skill.sh
```

### 2. Create a New Skill

Use the scaffold script to create a new skill:

```bash
./new-skill.sh my-skill-name "Description of what this skill does"
```

This creates a new folder with a pre-populated template:
- `my-skill-name/SKILL.md` - Main skill content
- `my-skill-name/assets/` - Directory for supporting files

### 3. Edit Your Skill

Open `my-skill-name/SKILL.md` and customize:
- **Frontmatter**: Update name and description
- **Tags**: Add relevant keywords for discovery
- **Overview**: Describe what the skill does
- **Content**: Add guidelines, examples, best practices, etc.
- **Assets**: Place any supporting files in the `assets/` folder

### 4. Build and Package

When ready to upload, run the build script:

```bash
./build.sh
```

This generates compressed `.zip` files in the `build/` directory, ready for upload to Claude.

## Scripts Reference

### new-skill.sh

Creates a new skill from a template.

**Usage:**
```bash
./new-skill.sh <skill-name> [description]
```

**Arguments:**
- `skill-name` (required): Lowercase letters, numbers, and hyphens only
- `description` (optional): Brief description of the skill

**Examples:**
```bash
# With description
./new-skill.sh company-policies "Corporate policies and guidelines"

# Without description (uses default)
./new-skill.sh api-reference
```

**Features:**
- Validates skill name format
- Prevents overwriting existing skills
- Creates proper directory structure
- Generates comprehensive SKILL.md template
- Includes creation timestamp

### build.sh

Packages all skills into uploadable zip files.

**Usage:**
```bash
./build.sh
```

**What it does:**
- Automatically detects all skill folders (containing `SKILL.md`)
- Compresses each skill with all assets
- Outputs to `./build/` directory
- Excludes `.DS_Store` and `__MACOSX` files
- Cleans previous builds

**Output:**
```
build/
├── skill-one.zip
├── skill-two.zip
└── skill-three.zip
```

## Skill Template Structure

Each skill should follow this structure in `SKILL.md`:

```markdown
---
name: skill-name
description: Brief description
---

# Skill Name

## Tags
- relevant
- keywords

## Overview
[What this skill does and when to use it]

## When to Use This Skill
- Scenario 1
- Scenario 2

## Key Information
[Guidelines, data, and reference material]

## Examples
[Practical examples of using the skill]

## Best Practices
[Recommendations and tips]
```

## Current Skills

### mypass-brand-guidelines
Authoritative guidance on MyPass Global's brand identity, including logo usage, color palette, typography, and brand personality for consistent application across all communications and materials.

## Uploading Skills to Claude

After running `./build.sh`:

1. Navigate to the `build/` folder
2. Locate the `.zip` file for your skill
3. Upload to Claude through the web interface
4. Claude will now have access to that specialized knowledge

## Best Practices

### Creating Effective Skills

- **Be specific**: Focus on a single domain or use case
- **Include examples**: Show practical applications
- **Add context**: Explain when and why to use the skill
- **Use assets**: Include reference images, documents, or data files
- **Keep updated**: Review and update skills as information changes

### Organizing Content

- **Clear structure**: Use consistent headings and sections
- **Actionable guidance**: Provide clear instructions and rules
- **Comprehensive tags**: Help with skill discovery and relevance
- **Version tracking**: Note creation date and version changes

### Managing Assets

- Place all supporting files in the `assets/` folder
- Use descriptive filenames
- Optimize file sizes where possible
- Reference assets clearly in your SKILL.md

## Development Workflow

1. **Create**: `./new-skill.sh skill-name "Description"`
2. **Edit**: Add content to `skill-name/SKILL.md`
3. **Add assets**: Place files in `skill-name/assets/`
4. **Build**: `./build.sh`
5. **Upload**: Upload from `build/skill-name.zip` to Claude
6. **Test**: Verify the skill works as expected in Claude
7. **Iterate**: Update and rebuild as needed

## Contributing

When adding new skills to this repository:

1. Use the scaffold script for consistency
2. Follow the template structure
3. Include comprehensive documentation
4. Test before committing
5. Update this README if adding new skills

## Repository Maintenance

- The `build/` directory is gitignored
- Scripts are executable and committed to the repo
- Each skill is self-contained in its own directory
- Only commit source files, not built packages

## Future Enhancements

- Direct deployment to Claude via API (when available)
- Skill validation and linting
- Version management system
- Skill dependency handling
- Automated testing framework

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Built with ❤️ for enhancing Claude's capabilities
