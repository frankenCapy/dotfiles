---
name: skill-creator
description: Create and manage Agent Skills following official best practices. Use when the user asks to create a new skill, update an existing skill, or needs help with skill structure and formatting.
---

# Skill Creator

This Skill helps you create and manage Agent Skills that extend Claude's capabilities in Claude Code.

## Critical First Step

**ALWAYS read [DOCUMENTATION.md](DOCUMENTATION.md) before creating or updating any skill.** This ensures you follow the latest official best practices and requirements.

## Instructions

### Creating a New Skill

1. **Read the documentation first**: Review [DOCUMENTATION.md](DOCUMENTATION.md) for current requirements
2. **Determine skill type**:
   - Personal skill: `~/.claude/skills/skill-name/`
   - Project skill: `.claude/skills/skill-name/`
3. **Create directory structure**:
   ```bash
   mkdir -p [path]/skill-name
   ```
4. **Write SKILL.md with proper frontmatter**:
   - `name`: lowercase, hyphens only, max 64 chars
   - `description`: what it does AND when to use it, max 1024 chars
5. **Add supporting files if needed**: scripts, templates, reference docs
6. **Test the skill**: Ask questions that match the description

### Updating an Existing Skill

1. **Read the documentation first**: Review [DOCUMENTATION.md](DOCUMENTATION.md) for current best practices
2. **Read the existing SKILL.md**: Understand current implementation
3. **Validate YAML frontmatter**: Ensure proper syntax
4. **Update description if behavior changes**: Keep it specific and trigger-rich
5. **Test after changes**: Verify the skill activates correctly

### Best Practices Checklist

- ✓ Name uses lowercase and hyphens only
- ✓ Description includes both WHAT and WHEN
- ✓ Description contains specific trigger keywords
- ✓ Instructions are clear and step-by-step
- ✓ Examples are concrete and actionable
- ✓ YAML frontmatter is valid (no tabs, proper indentation)
- ✓ Supporting files use forward slashes in paths
- ✓ Skill is focused on ONE capability

## Examples

### Good Skill Structure

```yaml
---
name: commit-message-generator
description: Generate conventional commit messages from git diffs. Use when creating commits, writing commit messages, or reviewing staged changes.
---

# Commit Message Generator

## Instructions
1. Run `git diff --staged` to see changes
2. Analyze the changes and determine type (feat, fix, chore, etc.)
3. Generate commit message following conventional commits format
4. Keep summary under 50 characters
5. Include detailed body if needed

## Format
<type>(<scope>): <summary>

<body>

## Examples
- feat(auth): add OAuth2 login support
- fix(api): handle null response in user endpoint
- chore(deps): update dependencies to latest versions
```

### Good vs Bad Descriptions

**Bad** (too vague):
```yaml
description: Helps with files
```

**Good** (specific with triggers):
```yaml
description: Analyze Excel spreadsheets, create pivot tables, generate charts. Use when working with Excel files, spreadsheets, .xlsx files, or tabular data analysis.
```

## Common Pitfalls

### 1. Vague Descriptions
**Problem**: Claude won't know when to use the skill
**Solution**: Include specific keywords users would mention

### 2. Invalid YAML
**Problem**: Skill won't load
**Solution**: Validate frontmatter syntax, no tabs, proper closing `---`

### 3. Too Broad Scope
**Problem**: Skill tries to do too much
**Solution**: Split into focused, single-purpose skills

### 4. Missing Trigger Keywords
**Problem**: Description doesn't match user queries
**Solution**: Include file types, operations, and contexts in description

## Validation Steps

Before finishing a skill:
1. Check YAML syntax is valid
2. Verify name follows lowercase-hyphen convention
3. Confirm description is under 1024 characters
4. Test that description includes triggers
5. Ensure instructions are clear and actionable
6. Verify file paths use forward slashes

## Reference

For complete documentation, examples, and troubleshooting, see [DOCUMENTATION.md](DOCUMENTATION.md).
