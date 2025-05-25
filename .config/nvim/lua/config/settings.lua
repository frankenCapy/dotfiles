-- global
vim.g.mapleader        = ','
vim.g.maplocalleader   = ' '
vim.g.nomodeline       = true
vim.g.hidden           = true
vim.g.scrolloff        = 8
vim.g.nowrap           = true
vim.g.colemakdh        = true

-- options
vim.opt.completeopt    = "menu,menuone,noselect" --- Better autocompletion
vim.opt.cursorline     = true                    --- Highlight of current line
vim.opt.list           = true                    --- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars      = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand     = 'split'                 --- Show live preview of substitution
vim.opt.emoji          = false                   --- Fix emoji display
vim.opt.expandtab      = true                    --- Use spaces instead of tabs
vim.opt.foldlevelstart = 99                      --- Expand all folds by default
vim.opt.ignorecase     = true                    --- Needed for smartcase
vim.opt.lazyredraw     = false                   --- Makes macros faster & prevent errors in complicated mappings
vim.opt.mouse          = "a"                     --- Enable mouse
vim.opt.number         = true                    --- Shows current line number
vim.opt.pumheight      = 10                      --- Max num of items in dompletion menu
vim.opt.relativenumber = false                   --- relative number
vim.opt.scrolloff      = 4                       --- Always keep space when scrolling to bottom/top edge
vim.opt.shiftwidth     = 2                       --- Change a number of space characeters inseted for indentation
vim.opt.smartcase      = true                    --- Uses case in search
vim.opt.smartindent    = true                    --- Makes indenting smart
vim.opt.smarttab       = true                    --- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.softtabstop    = 2                       --- Insert 2 spaces for a tab
vim.opt.splitright     = true                    --- Vertical splits to the right
vim.opt.splitbelow     = true                    --- Horizontal split to the bottom
vim.opt.signcolumn     = "yes"                   --- Always show signcolumn
vim.opt.swapfile       = false                   --- Swap not needed
vim.opt.tabstop        = 2                       --- Insert 2 spaces for a tab
vim.opt.termguicolors  = true                    --- Correct terminal colors
vim.opt.timeoutlen     = 300                     --- Faster completion
vim.opt.undofile       = true                    --- Sets undo to file
vim.opt.updatetime     = 100                     --- Faster completion
vim.opt.viminfo        = "'1000"                 --- Increase the size of file history
vim.opt.wildignore     = "*node_modules/**"      --- Don't search inside Node.js modules
vim.opt.wrap           = false                   --- Display long lines as just one line
vim.opt.writebackup    = false                   --- Not needed
vim.opt.autoindent     = true                    --- Good auto indent
vim.opt.backspace      = "indent,eol,start"      --- Making sure backspace works
vim.opt.backup         = false                   --- Recommended by coc
vim.opt.conceallevel   = 0                       --- Show `` in markdown files
vim.opt.encoding       = "utf-8"                 --- The encoding displayed
vim.opt.errorbells     = false                   --- Disables sound effect for errors
vim.opt.fileencoding   = "utf-8"                 --- The encoding written to file
vim.opt.incsearch      = true                    --- Start searching before pressing enter
vim.opt.showmode       = false                   --- Don't show things like -- INSERT -- anymore
vim.opt.showmatch      = true                    --- highlight mathing paranthesis
vim.opt.foldmethod     = 'marker'                --- enable folding
vim.opt.linebreak      = true                    --- wrap long lines at 'breakat'

-- buffer options
vim.bo.syntax          = 'ON'
vim.bo.shiftwidth      = 2
vim.bo.tabstop         = 2
vim.bo.expandtab       = true
vim.bo.swapfile        = false
