---
name: skill-management
description: Manage all aspects of Claude Code skills including creating, editing, viewing, debugging, removing, testing, and optimizing skills. Use whenever user mentions skills, SKILL.md files, skill directories, wants to work with skills in any way, or discusses making capabilities reusable or automatic. Handle all skill-related requests.
---

# Skill Management Expert

Create, update, debug, view, and manage Claude Code skills following official best practices and conventions.

## What are Agent Skills?

Skills are **model-invoked** capabilities—Claude autonomously decides when to use them based on your request and the Skill's description. This differs from slash commands, which are **user-invoked** (explicitly triggered by typing `/command`).

Skills are automatically discovered from three sources:
- **Personal Skills**: `~/.claude/skills/` (available across all projects)
- **Project Skills**: `.claude/skills/` (shared with team via git)
- **Plugin Skills**: Bundled with installed Claude Code plugins

## Instructions

You are a Claude Code skill management expert. When invoked, guide the user through creating, updating, viewing, debugging, or removing skills with proper structure, frontmatter, and documentation.

### Common Management Operations:

**View available Skills**:
- Ask Claude directly: "What Skills are available?" or "List all available Skills"
- Shows all Skills from personal, project, and plugin sources
- Alternatively, use filesystem: `ls ~/.claude/skills/` or `ls .claude/skills/`

**Update a Skill**:
- Edit SKILL.md directly: `code ~/.claude/skills/skill-name/SKILL.md` (personal) or `code .claude/skills/skill-name/SKILL.md` (project)
- Changes take effect after restarting Claude Code
- Follow the creation steps below for proper structure

**Remove a Skill**:
- Delete the skill directory: `rm -rf ~/.claude/skills/skill-name` (personal) or `rm -rf .claude/skills/skill-name` (project)
- For project skills, commit the removal: `git commit -m "Remove unused skill"`

**Debug a Skill**:
- See Testing and Debugging section below
- Run `claude --debug` to see loading errors

### Steps to Create a New Skill:

1. **Gather Requirements**:
   - Ask what capability the skill should provide
   - Determine when the skill should be triggered (model-invoked behavior)
   - Identify if any tools should be restricted using `allowed-tools`
   - Check if skill needs external packages (list them in description)
   - Confirm the skill name (lowercase, hyphens, numbers only, max 64 chars)
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
   - Note that changes take effect on next Claude Code start/restart
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

The description is critical for Claude to discover when to use your Skill. Include both WHAT it does and WHEN to use it, with specific trigger terms.

Good descriptions:
- "Generate conventional commits from staged git changes. Use when user requests creating a commit following conventional commit format."
- "Extract text and tables from PDF files, fill forms, merge documents. Use when working with PDF files or when the user mentions PDFs, forms, or document extraction."
- "Analyze Excel spreadsheets, create pivot tables, and generate charts. Use when working with Excel files, spreadsheets, or analyzing tabular data in .xlsx format."

Poor descriptions:
- "A skill for commits" (too vague, no trigger condition)
- "Helps with documents" (no specificity about what or when)
- "This helpful skill will assist you with PDF files" (wordy, unclear when to use)
- "For files" (completely non-specific)

### allowed-tools Usage:

Use `allowed-tools` to limit which tools Claude can use when a Skill is active. When specified, Claude can use only the listed tools without needing permission. This is useful for:
- Read-only Skills that shouldn't modify files
- Skills with limited scope (e.g., only data analysis)
- Security-sensitive workflows

**Example**:
```yaml
---
name: safe-file-reader
description: Read files without making changes. Use when you need read-only file access.
allowed-tools: [Read, Grep, Glob]
---
```

**Common tool groups**:
- Read-only: `[Read, Grep, Glob]`
- Write-only: `[Write, Edit]`
- Git operations: `[Bash]` (for git commands)
- Full access: Omit `allowed-tools` field (Claude asks for permission as normal)

**Note**: `allowed-tools` is only supported for Skills in Claude Code.

### Testing and Debugging:

**Test your Skill**:
1. Ask questions that match your description's trigger terms
2. Claude autonomously decides to use your Skill if it matches—no explicit invocation needed
3. Verify the Skill activates in expected scenarios

**If Claude doesn't use your Skill, check**:
- Is the description specific enough with clear trigger terms?
- Is the YAML frontmatter valid (no tabs, correct syntax)?
- Is the file at the correct location (`~/.claude/skills/*/SKILL.md` or `.claude/skills/*/SKILL.md`)?
- Did you restart Claude Code after creating/editing the Skill?

**Debug mode**:
Run `claude --debug` to see Skill loading errors and diagnostic information.

**Multiple Skills conflict**:
Make descriptions distinct with specific trigger terms. Instead of generic terms like "data analysis", use specific terms like "sales reports and CRM exports" vs "log files and system metrics".

### Package Dependencies:

If your Skill requires external packages:
1. List required packages in the description
2. Packages must be installed in the user's environment before Claude can use them
3. Claude will automatically install dependencies or ask for permission when needed

**Example**:
```yaml
description: Extract text from PDF files using pdfplumber. Use when working with PDF files. Requires pdfplumber and pypdf packages.
```

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

### Multi-file Skill with Dependencies:
```
pdf-processing/
├── SKILL.md
├── FORMS.md
├── REFERENCE.md
└── scripts/
    ├── fill_form.py
    └── validate.py
```

**SKILL.md**:
````yaml
---
name: pdf-processing
description: Extract text, fill forms, merge PDFs. Use when working with PDF files, forms, or document extraction. Requires pypdf and pdfplumber packages.
---

# PDF Processing

## Quick start

Extract text:
```python
import pdfplumber
with pdfplumber.open("doc.pdf") as pdf:
    text = pdf.pages[0].extract_text()
```

For form filling, see [FORMS.md](FORMS.md).
For detailed API reference, see [REFERENCE.md](REFERENCE.md).

## Requirements

Packages must be installed in your environment:
```bash
pip install pypdf pdfplumber
```
````

**Note**: Claude loads additional files only when needed (progressive disclosure).

## Sharing Skills:

**Recommended**: Distribute Skills through Claude Code plugins
**Alternative**: Share project Skills via git (stored in `.claude/skills/`)

When team members pull project Skills from git, they're immediately available (after restarting Claude Code).

## Version History

- v1.2.0 (2025-11-16): Expanded to full skill management
  - Renamed from `skill-creation` to `skill-management`
  - Added management operations: view, update, remove, debug
  - Updated description to cover all management activities
- v1.1.0 (2025-11-16): Updated with official Claude Code documentation
  - Added plugin Skills information
  - Enhanced testing and debugging guidance
  - Improved description writing tips with more examples
  - Added package dependency handling
  - Clarified model-invoked vs user-invoked distinction
- v1.0.0 (2025-11-04): Initial skill creation expert
