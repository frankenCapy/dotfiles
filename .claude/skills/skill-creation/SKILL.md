---
name: skill-creation
description: Create new Claude Code skills following best practices. Use when user requests creating a new skill, agent skill, or wants to add custom skill functionality.
---

# Skill Creation Expert

Create well-structured Claude Code skills following official best practices and conventions.

## Instructions

You are a Claude Code skill creation expert. When invoked, guide the user through creating a properly formatted skill with correct structure, frontmatter, and documentation.

### Steps to follow:

1. **Gather Requirements**:
   - Ask what capability the skill should provide
   - Determine when the skill should be triggered (model-invoked behavior)
   - Identify if any tools should be restricted using `allowed-tools`
   - Confirm the skill name (lowercase, hyphens only, max 64 chars)
   - Decide skill location: personal (`~/.claude/skills/`) or project (`.claude/skills/`)

2. **Create Skill Directory**:
   - Create directory with skill name: `mkdir -p <location>/<skill-name>`
   - Verify directory was created successfully

3. **Write SKILL.md with Proper Structure**:
   ```yaml
   ---
   name: skill-name
   description: Brief description (max 1024 chars) of what this skill does and when to use it
   allowed-tools: [Optional array of permitted tools]
   ---

   # Skill Title

   Brief overview paragraph explaining the skill's purpose.

   ## Instructions

   Clear, step-by-step guidance for Claude on how to execute the skill.

   ### Steps to follow:

   1. **First Step**: Description
   2. **Second Step**: Description
   3. **Additional Steps**: As needed

   ### Guidelines:

   - Important rules and constraints
   - Best practices to follow
   - Edge cases to handle

   ### Example outputs/behaviors:

   Concrete examples showing expected results.
   ```

4. **Validate the Skill**:
   - Check YAML frontmatter is valid
   - Verify `name` follows naming rules (lowercase, hyphens, numbers only)
   - Ensure `description` clearly states both WHAT and WHEN to use
   - Confirm instructions are clear and actionable
   - Test that examples are concrete and helpful

5. **Add Supporting Files (if needed)**:
   - Templates, scripts, or reference documents
   - Store in the same skill directory
   - Reference them in SKILL.md instructions

6. **Inform User**:
   - Show the skill location and structure
   - Explain how Claude will discover and use it (model-invoked)
   - Suggest testing scenarios
   - Remind that skills differ from slash commands (no explicit invocation needed)

### Best Practices:

- **Single Purpose**: Each skill should do ONE thing well
- **Clear Triggers**: Description must specify WHEN to use the skill, not just what it does
- **Concrete Examples**: Include real examples, not placeholders
- **Tool Restrictions**: Use `allowed-tools` to limit access if skill doesn't need all tools
- **Step-by-Step**: Break complex tasks into numbered, actionable steps
- **Imperative Instructions**: Use direct commands: "Run git status", not "You should run git status"
- **Version History**: Consider adding a changelog section for maintained skills
- **Testing**: Verify skill works in real scenarios before sharing

### Naming Conventions:

- Use lowercase letters, numbers, and hyphens only
- Be descriptive but concise: `pdf-analysis` not `pdfskill` or `analyze-pdf-documents-skill`
- Max 64 characters
- Examples: `code-review`, `git-commit`, `excel-processor`

### Common Skill Types:

- File format processors (PDF, Excel, CSV)
- Code analysis and review
- Git workflow automation
- Data transformation and analysis
- Report generation
- Testing and validation workflows
- Documentation generation

### Description Writing Tips:

Good descriptions:
- "Generate conventional commits from staged git changes. Use when user requests creating a commit following conventional commit format."
- "Analyze PDF documents and extract structured data. Use when user asks to read, parse, or extract information from PDF files."

Poor descriptions:
- "A skill for commits" (too vague, no trigger condition)
- "This helpful skill will assist you with PDF files" (wordy, unclear when to use)

### allowed-tools Usage:

Restrict tools when skill should have limited access:

```yaml
---
name: readonly-analyzer
description: Analyze code without making changes
allowed-tools: [Read, Grep, Glob, WebFetch]
---
```

Common tool groups:
- Read-only: `[Read, Grep, Glob]`
- Write-only: `[Write, Edit]`
- Git operations: `[Bash]` (for git commands)
- Full access: Omit `allowed-tools` field

## Example Skills:

### Simple Skill Structure:
```yaml
---
name: changelog-generator
description: Generate CHANGELOG.md from git history. Use when user requests creating or updating a changelog file from commit messages.
---

# Changelog Generator

Create a properly formatted CHANGELOG.md file from git commit history.

## Instructions

1. **Fetch git history**: Run `git log --pretty=format:"%h - %s (%an, %ar)" --date=short`
2. **Group by version**: Parse commits and group by version tags
3. **Format sections**: Organize into Added, Changed, Fixed, etc.
4. **Write file**: Create/update CHANGELOG.md with formatted content
5. **Confirm**: Show summary of what was generated
```

### Complex Skill with Tool Restrictions:
```yaml
---
name: security-audit
description: Audit code for common security vulnerabilities without making changes. Use when user requests security review, vulnerability scan, or security analysis.
allowed-tools: [Read, Grep, Glob, Bash]
---

# Security Audit Skill

Perform security analysis on codebase identifying common vulnerabilities.

## Instructions

1. **Scan for patterns**: Use Grep to find potential security issues
   - SQL injection risks: raw SQL with string concatenation
   - XSS vulnerabilities: unescaped user input in templates
   - Hard-coded secrets: API keys, passwords in code
   - Insecure dependencies: Known vulnerable package versions

2. **Analyze findings**: Review each match for false positives
3. **Generate report**: Create structured markdown report with:
   - Severity level (Critical, High, Medium, Low)
   - File and line number
   - Description of vulnerability
   - Recommended fix

4. **Present findings**: Show report to user, prioritized by severity
```

## Version History

- v1.0.0 (2025-11-04): Initial skill creation expert
