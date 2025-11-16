---
name: git-worktrees
description: Manage git worktrees for parallel branch development. Use when user mentions worktrees, parallel development, working on multiple branches simultaneously, checking out multiple branches at once, or needs to create/manage/remove/list worktrees.
---

# Git Worktrees Management

Efficiently manage multiple git worktrees to work on different branches simultaneously without switching contexts or stashing changes.

## What are Git Worktrees?

Git worktrees allow you to have multiple working directories (branches checked out simultaneously) while sharing a single `.git` database. This eliminates the need to constantly switch branches or stash changes.

## Instructions

### Core Operations

#### 1. Creating Worktrees

**Create worktree for new branch**:
```bash
git worktree add <path> -b <new-branch>
```
Example: `git worktree add ../feature-auth -b feature/authentication`

**Create worktree for existing branch**:
```bash
git worktree add <path> <existing-branch>
```
Example: `git worktree add ../hotfix hotfix/critical-bug`

**Create worktree from remote branch**:
```bash
git worktree add <path> <branch-name>
```
Git will automatically track the remote branch if it exists in exactly one remote.

**Create temporary worktree (detached HEAD)**:
```bash
git worktree add -d <path>
```
Useful for testing without creating a branch.

**Recommended directory structure**:
- Use a consistent naming pattern
- Place worktrees in parent directory or subdirectory: `../worktrees/<branch-name>`
- Or use the repository structure: `repo-name/main/`, `repo-name/feature-1/`, etc.

#### 2. Listing Worktrees

**Basic list**:
```bash
git worktree list
```
Shows path, commit hash, and branch for each worktree.

**Verbose list with annotations**:
```bash
git worktree list -v
```
Shows additional information including locked or prunable worktrees.

**Porcelain format for scripting**:
```bash
git worktree list --porcelain
```

#### 3. Removing Worktrees

**Remove clean worktree**:
```bash
git worktree remove <path>
```
Only works if worktree has no untracked files or modifications.

**Force remove worktree**:
```bash
git worktree remove -f <path>
```
Use with caution - removes even with uncommitted changes.

**Prune stale worktree metadata**:
```bash
git worktree prune
```
Cleans up metadata for manually deleted worktrees.

#### 4. Other Operations

**Lock worktree** (prevent automatic pruning):
```bash
git worktree lock --reason "reason text" <path>
```

**Unlock worktree**:
```bash
git worktree unlock <path>
```

**Move worktree**:
```bash
git worktree move <worktree> <new-path>
```

**Repair worktrees** (after manual moves):
```bash
git worktree repair
```

### Best Practices

1. **Organized Structure**: Use consistent naming and location for worktrees
   - Group in a `worktrees/` subdirectory
   - Name directories after branch names
   - Example: `worktrees/feature-auth/`, `worktrees/hotfix-123/`

2. **Limit Active Worktrees**: Only create worktrees for current active tasks
   - Don't leave old worktrees around
   - Remove when done: `git worktree remove <path>`

3. **Regular Cleanup**: Run `git worktree prune` periodically
   - Removes metadata for deleted worktrees
   - Keeps repository clean

4. **Clean Removal**: Always use `git worktree remove` instead of manual deletion
   - Properly updates git metadata
   - Use `-f` flag only when necessary

5. **Branch Management**: Each worktree can only check out a branch once
   - Can't have same branch in multiple worktrees
   - Use `--force` to override (not recommended)

### Common Workflows

#### Emergency Fix While Refactoring

When you need to make an urgent fix without disturbing current work:

```bash
# Create worktree for emergency fix
git worktree add ../hotfix -b hotfix/urgent-bug master

# Work in the hotfix worktree
cd ../hotfix
# ... make fixes ...
git commit -am "Fix urgent bug"
git push

# Return to main work
cd -

# Remove hotfix worktree
git worktree remove ../hotfix
```

#### Parallel Feature Development

Work on multiple features simultaneously:

```bash
# Create worktrees for different features
git worktree add ../feature-1 -b feature/user-auth
git worktree add ../feature-2 -b feature/dashboard

# Switch between them by changing directories
cd ../feature-1
# ... work on auth ...

cd ../feature-2
# ... work on dashboard ...
```

#### Code Review

Review PR without losing current work:

```bash
# Create temporary worktree for review
git worktree add ../review pr-branch

cd ../review
# ... review code, test changes ...
cd -

# Remove when done
git worktree remove ../review
```

#### Clean Build/Test Environment

Create pristine environment for testing:

```bash
# Create worktree at specific commit
git worktree add ../test-build <commit-hash> -d

cd ../test-build
# ... run tests, build ...
cd -

git worktree remove ../test-build
```

### Troubleshooting

**Error: "fatal: '<branch>' is already checked out"**
- A branch can only be checked out in one worktree at a time
- Use a different branch or remove the existing worktree first
- Or use `--force` to override (not recommended)

**Stale worktree metadata**
- If you manually deleted a worktree directory, run `git worktree prune`
- This cleans up the metadata

**Worktree moved manually**
- Run `git worktree repair` to reestablish connections
- Better to use `git worktree move` instead

**Locked worktree won't prune**
- Unlock first: `git worktree unlock <path>`
- Then remove: `git worktree remove <path>`

### Important Notes

- All worktrees share the same `.git` repository
- Refs and commits are shared across all worktrees
- Each worktree has its own HEAD, index, and working directory
- Configuration is shared by default (use `extensions.worktreeConfig` for per-worktree config)
- Submodules support is incomplete - use with caution

### Quick Reference

| Command | Purpose |
|---------|---------|
| `git worktree add <path> -b <branch>` | Create worktree with new branch |
| `git worktree add <path> <branch>` | Create worktree from existing branch |
| `git worktree list` | List all worktrees |
| `git worktree remove <path>` | Remove worktree |
| `git worktree prune` | Clean up stale metadata |
| `git worktree lock <path>` | Prevent pruning |
| `git worktree unlock <path>` | Allow pruning |
| `git worktree move <old> <new>` | Move worktree |
| `git worktree repair` | Fix broken connections |

## Examples

**Scenario 1: Urgent hotfix during refactoring**
```bash
git worktree add ../hotfix -b hotfix/security-patch main
cd ../hotfix
# fix, test, commit, push
cd -
git worktree remove ../hotfix
```

**Scenario 2: Review multiple PRs**
```bash
git worktree add ../pr-123 origin/pr-123
git worktree add ../pr-124 origin/pr-124
# review both in separate directories
git worktree remove ../pr-123
git worktree remove ../pr-124
```

**Scenario 3: Clean up old worktrees**
```bash
git worktree list
git worktree remove ../old-feature-1
git worktree remove ../old-feature-2
git worktree prune
```
