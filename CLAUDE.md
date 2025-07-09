# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for various development tools and desktop environments. The configurations are symlinked to their appropriate locations using the `install.sh` script.

## Installation and Setup

- **Initial setup**: Run `./install.sh` to create symlinks for all configuration files
- **Target locations**: Configurations are symlinked from repository structure to their expected system locations (e.g., `.config/nvim` � `~/.config/nvim`)

## Key Configurations

### Neovim Configuration Architecture

The Neovim configuration follows a modular Lua-based architecture:

- **Entry point**: `.config/nvim/init.lua` - loads core modules in sequence
- **Structure**:
  - `lua/config/` - Core editor configuration
    - `options.lua` - Vim settings and global options
    - `keymaps.lua` - Key mappings and shortcuts
    - `autocmds.lua` - Autocommands and event handlers
  - `lua/core/` - Bootstrap and initialization
    - `lazy.lua` - Lazy.nvim plugin manager setup
    - `lsp.lua` - Language Server Protocol configuration
  - `lua/plugins/` - Plugin configurations (lazy-loaded)
    - Individual plugin files (e.g., `blink.lua`, `snacks.lua`, `treesitter.lua`)

**Key settings**:
- Leader key: `,` (comma)
- Local leader: `<space>`
- Uses Colemak-DH keyboard layout (`vim.g.colemakdh = true`)
- Catppuccin Mocha colorscheme
- Treesitter-based folding enabled
- Performance optimizations (disabled unused plugins)

### tmux Configuration

- **File**: `.tmux.conf`
- **Prefix**: `C-a` (instead of default C-b)
- **Integration**: Smart pane/split integration with Neovim using `@pane-is-vim`
- **Custom keybindings**:
  - Split panes: `h/j/k/l` for directional splits
  - Session management: `f` (sessionizer), `s` (session chooser)
  - Git: `g` (lazygit popup)
- **Features**: Mouse support, 256-color support, status bar hidden

### Shell Configuration

- **Starship prompt**: `.config/starship.toml` with Catppuccin Mocha theme
- **Custom scripts**: `.local/scripts/` contains utility scripts:
  - `tmux-sessionizer` - Quick tmux session creation
  - `tmux-change-session` - Session switching interface
  - `spotify_current` - Display current Spotify track

### Desktop Environment

- **i3 window manager**: `.config/i3/`
- **Status bar**: i3status-rust (`.config/i3status-rust/`)
- **Application launcher**: Rofi (`.config/rofi/`)
- **Terminal**: Alacritty (`.config/alacritty/`)
- **Syntax highlighting**: Bat (`.config/bat/`)

## Development Workflow

When working with this repository:

1. Test changes in the actual config locations before committing
2. Use `./install.sh` to create/update symlinks after adding new configurations
3. Neovim plugins are managed via Lazy.nvim - they'll auto-install on first load
4. The configuration uses modern Neovim features (Lua, native LSP, Treesitter)

## File Organization

Configurations maintain their system directory structure within the repository:
- `.config/` - XDG config directory contents
- `.local/scripts/` - User scripts and utilities  
- `.tmux.conf` - tmux configuration in home directory
- `install.sh` - Symlink installation script

## Special Considerations

- Uses Colemak-DH keyboard layout optimizations
- Neovim configuration is performance-tuned with disabled unused features
- tmux/Neovim integration requires compatible key bindings
- All configurations use Catppuccin Mocha color scheme for consistency

## Claude Code Access

The `.config/` directory and other hidden files/directories are important parts of this dotfiles repository and should be accessible to Claude Code for configuration management and updates.

### File Access Configuration

For proper autocomplete functionality with the `@` symbol in Claude Code:
- All files in `.config/` directory should be discoverable and accessible
- Hidden directories and files (starting with `.`) are essential parts of this dotfiles repository
- The repository structure includes important configuration files in subdirectories like:
  - `.config/nvim/` - Neovim configuration
  - `.config/alacritty/` - Terminal configuration  
  - `.config/i3/` - Window manager configuration
  - `.config/starship.toml` - Shell prompt configuration
  - `.local/scripts/` - Custom utility scripts

Claude Code should have full access to browse and autocomplete all files within the repository structure, including hidden files and directories.

## Code Editing Standards

When making edits to files:
- NEVER include trailing whitespace in new_string values
- NEVER include lines with only spaces
- Ensure all lines either have content or are completely empty
- The codebase has auto-trim on save, but edits should be clean from the start
