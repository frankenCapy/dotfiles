---
name: conventional-commit
description: Create conventional commits from staged Git changes. Use when user requests creating a commit following conventional commit format or asks for a properly formatted commit message.
---

# Conventional Commit Skill

Create properly formatted conventional commits from currently staged Git changes following the Conventional Commits specification.

## Instructions

You are a conventional commit expert. When invoked, analyze the currently staged Git changes and create a properly formatted conventional commit.

### Steps to follow:

1. **Check staged changes**:
   - Run `git diff --cached` to see the actual code changes
   - Run `git status` to see which files are staged
   - If nothing is staged, inform the user and exit

2. **Analyze the changes** to determine:
   - **Type**: Choose the most appropriate type:
     - `feat`: A new feature
     - `fix`: A bug fix
     - `docs`: Documentation only changes
     - `style`: Changes that don't affect code meaning (formatting, whitespace, etc.)
     - `refactor`: Code change that neither fixes a bug nor adds a feature
     - `perf`: Performance improvement
     - `test`: Adding or modifying tests
     - `build`: Changes to build system or dependencies
     - `ci`: Changes to CI configuration
     - `chore`: Other changes that don't modify src or test files
   - **Scope** (optional): The area of codebase affected (e.g., api, auth, ui, parser)
   - **Description**: Short summary in imperative mood (e.g., "add", not "added" or "adds")
   - **Body** (optional): More detailed explanation if changes are complex
   - **Breaking changes**: If the change breaks backward compatibility

3. **Format the commit message**:
   ```
   <type>[optional scope]: <description>

   [optional body]

   [optional footer(s)]
   ```

4. **Create the commit**:
   - Use `git commit` with a heredoc for the message
   - Format example:
     ```bash
     git commit -m "$(cat <<'EOF'
     feat(auth): add OAuth2 authentication support

     Implement OAuth2 flow with support for Google and GitHub providers.
     Includes token refresh logic and secure storage.

     BREAKING CHANGE: replaces the old session-based auth system
     EOF
     )"
     ```

5. **Confirm with the user**: Show the commit message before committing and run `git log -1` after to confirm success.

### Guidelines:

- Keep the description line under 72 characters
- Use imperative mood: "add" not "added" or "adds"
- Don't capitalize the first letter of description
- No period at the end of description
- Include body only for non-trivial changes
- Use `BREAKING CHANGE:` footer for breaking changes
- Be accurate in type selection based on actual code changes
- If multiple types apply, choose the most significant one

### Example commits:

```
feat: add user profile export functionality
```

```
fix(api): handle null values in user response
```

```
refactor(parser)!: simplify token matching logic

BREAKING CHANGE: removes deprecated parseOld() function
```

```
docs: update installation instructions for Python 3.12
```
