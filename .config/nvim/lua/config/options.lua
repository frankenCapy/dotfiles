-- global
vim.g.mapleader               = ','
vim.g.maplocalleader          = ' '
vim.g.nomodeline              = true
vim.g.hidden                  = true
vim.g.scrolloff               = 8
vim.g.nowrap                  = true
vim.g.colemakdh               = false

-- Disable unused providers for faster startup
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_node_provider    = 0

-- options
vim.opt.cursorline            = true
vim.opt.ignorecase            = true
vim.opt.smartcase             = true
vim.opt.mouse                 = "a"
vim.opt.number                = true
vim.opt.pumheight             = 15
vim.opt.relativenumber        = false
vim.opt.scrolloff             = 10
vim.opt.sidescrolloff         = 8
vim.opt.shiftwidth            = 2
vim.opt.smartindent           = true
vim.opt.smarttab              = true
vim.opt.softtabstop           = 2
vim.opt.splitright            = true
vim.opt.splitbelow            = true
vim.opt.signcolumn            = "yes"
vim.opt.swapfile              = false
vim.opt.tabstop               = 2
vim.opt.termguicolors         = true
vim.opt.timeoutlen            = 300
vim.opt.undofile              = true
vim.opt.undolevels            = 10000
vim.opt.updatetime            = 300
vim.opt.autoread              = true
vim.opt.wildignore            = "*node_modules/**,*.git/**,*.DS_Store,*.pyc,__pycache__/**"
vim.opt.wrap                  = false
vim.opt.autoindent            = true
vim.opt.backspace             = "indent,eol,start"
vim.opt.backup                = false
vim.opt.conceallevel          = 0
vim.opt.encoding              = "utf-8"
vim.opt.errorbells            = false
vim.opt.fileencoding          = "utf-8"
vim.opt.incsearch             = true
vim.opt.showmode              = false
vim.opt.showmatch             = true
vim.opt.foldmethod            = 'expr'
vim.opt.foldexpr              = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable            = false
vim.opt.linebreak             = true
vim.opt.breakindent           = true
vim.opt.virtualedit           = "block"
vim.opt.winminwidth           = 5
vim.opt.winminheight          = 1
vim.opt.confirm               = true
vim.opt.expandtab             = true

-- Statusline configuration
vim.opt.laststatus            = 3 -- Global statusline

-- Clipboard integration
vim.opt.clipboard             = "unnamedplus"

-- Search improvements
vim.opt.grepprg               = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat            = "%f:%l:%c:%m"

-- buffer options
vim.bo.syntax                 = 'ON'

-- Automatically remove trailing whitespace and empty lines
vim.opt.list                  = true
vim.opt.listchars             = { tab = '→ ', trail = '·', nbsp = '⎵', extends = '›', precedes = '‹' }

-- Column width guide
vim.opt.colorcolumn           = ''

-- Line spacing
vim.opt.linespace             = 2

-- Better split separators
vim.opt.fillchars             = { vert = '│', fold = '·', diff = '-', eob = ' ' }

-- Format options to prevent auto-insertion of comment leaders
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
