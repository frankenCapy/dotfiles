-- global
vim.g.mapleader        = ','
vim.g.maplocalleader   = ' '
vim.g.nomodeline       = true
vim.g.hidden           = true
vim.g.scrolloff        = 8
vim.g.nowrap           = true
vim.g.colemakdh        = true

-- Performance improvements
vim.g.loaded_gzip              = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1

-- options
vim.opt.completeopt     = "menu,menuone,noselect"
vim.opt.cursorline      = true
vim.opt.list            = true
vim.opt.listchars       = { tab = '» ', trail = '·', nbsp = '␣', extends = '❯', precedes = '❮' }
vim.opt.inccommand      = 'split'
vim.opt.emoji           = false
vim.opt.expandtab       = true
vim.opt.foldlevelstart  = 99
vim.opt.ignorecase      = true
vim.opt.lazyredraw      = false
vim.opt.mouse           = "a"
vim.opt.number          = true
vim.opt.pumheight       = 15  -- Increased from 10
vim.opt.relativenumber  = true  -- Enable relative numbers for better navigation
vim.opt.scrolloff       = 8    -- Increased from 4, matches your global setting
vim.opt.sidescrolloff   = 8    -- Add horizontal scroll offset
vim.opt.shiftwidth      = 2
vim.opt.smartcase       = true
vim.opt.smartindent     = true
vim.opt.smarttab        = true
vim.opt.softtabstop     = 2
vim.opt.splitright      = true
vim.opt.splitbelow      = true
vim.opt.signcolumn      = "yes"
vim.opt.swapfile        = false
vim.opt.tabstop         = 2
vim.opt.termguicolors   = true
vim.opt.timeoutlen      = 300
vim.opt.undofile        = true
vim.opt.undolevels      = 10000  -- More undo history
vim.opt.updatetime      = 200    -- Slightly increased from 100
vim.opt.viminfo         = "'1000"
vim.opt.wildignore      = "*node_modules/**,*.git/**,*.DS_Store,*.pyc,__pycache__/**"
vim.opt.wrap            = false
vim.opt.writebackup     = false
vim.opt.autoindent      = true
vim.opt.backspace       = "indent,eol,start"
vim.opt.backup          = false
vim.opt.conceallevel    = 0
vim.opt.encoding        = "utf-8"
vim.opt.errorbells      = false
vim.opt.fileencoding    = "utf-8"
vim.opt.incsearch       = true
vim.opt.showmode        = false
vim.opt.showmatch       = true
vim.opt.foldmethod      = 'expr'  -- Use treesitter for folding
vim.opt.foldexpr        = 'nvim_treesitter#foldexpr()'
vim.opt.linebreak       = true
vim.opt.breakindent     = true    -- Preserve indentation in wrap
vim.opt.virtualedit     = "block"
vim.opt.winminwidth     = 5
vim.opt.winminheight    = 1
vim.opt.confirm         = true

-- Search improvements
vim.opt.grepprg         = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat      = "%f:%l:%c:%m"

-- buffer options
vim.bo.syntax          = 'ON'
vim.bo.shiftwidth      = 2
vim.bo.tabstop         = 2
vim.bo.expandtab       = true
vim.bo.swapfile        = false
