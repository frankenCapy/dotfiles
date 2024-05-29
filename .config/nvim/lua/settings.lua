-- global
local globalOptions = {
  mapleader = ',',
  maplocalleader = ' ',
  nomodeline = true,
  hidden = true,
  scrolloff = 4,
  nowrap = true,
  colemakdh = true,
}

-- options
local options = {
  completeopt    = "menu,menuone,noselect", --- Better autocompletion
  cursorline     = true,                    --- Highlight of current line
  emoji          = false,                   --- Fix emoji display
  expandtab      = true,                    --- Use spaces instead of tabs
  foldlevelstart = 99,                      --- Expand all folds by default
  ignorecase     = true,                    --- Needed for smartcase
  lazyredraw     = false,                   --- Makes macros faster & prevent errors in complicated mappings
  mouse          = "a",                     --- Enable mouse
  number         = true,                    --- Shows current line number
  pumheight      = 10,                      --- Max num of items in dompletion menu
  relativenumber = false,                   --- relative number
  scrolloff      = 4,                       --- Always keep space when scrolling to bottom/top edge
  shiftwidth     = 2,                       --- Change a number of space characeters inseted for indentation
  smartcase      = true,                    --- Uses case in search
  smartindent    = true,                    --- Makes indenting smart
  smarttab       = true,                    --- Makes tabbing smarter will realize you have 2 vs 4
  softtabstop    = 2,                       --- Insert 2 spaces for a tab
  splitright     = true,                    --- Vertical splits to the right
  splitbelow     = true,                    --- Horizontal split to the bottom
  signcolumn     = "yes",                   --- Always show signcolumn
  swapfile       = false,                   --- Swap not needed
  tabstop        = 2,                       --- Insert 2 spaces for a tab
  termguicolors  = true,                    --- Correct terminal colors
  timeoutlen     = 300,                     --- Faster completion
  undofile       = true,                    --- Sets undo to file
  updatetime     = 100,                     --- Faster completion
  viminfo        = "'1000",                 --- Increase the size of file history
  wildignore     = "*node_modules/**",      --- Don't search inside Node.js modules
  wrap           = false,                   --- Display long lines as just one line
  writebackup    = false,                   --- Not needed
  -- Neovim defaults
  autoindent     = true,                    --- Good auto indent
  backspace      = "indent,eol,start",      --- Making sure backspace works
  backup         = false,                   --- Recommended by coc
  conceallevel   = 0,                       --- Show `` in markdown files
  encoding       = "utf-8",                 --- The encoding displayed
  errorbells     = false,                   --- Disables sound effect for errors
  fileencoding   = "utf-8",                 --- The encoding written to file
  incsearch      = true,                    --- Start searching before pressing enter
  showmode       = false,                   --- Don't show things like -- INSERT -- anymore
  showmatch      = true,                    --- highlight mathing paranthesis
  foldmethod     = 'marker',                --- enable folding
  linebreak      = true,                    --- wrap long lines at 'breakat'
}

-- buffer options
local bufferOptions = {
  syntax = 'ON',
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  swapfile = false,
}

--- apply options
for k, v in pairs(globalOptions) do
  vim.g[k] = v
end
for k, v in pairs(options) do
  vim.opt[k] = v
end
for k, v in pairs(bufferOptions) do
  vim.bo[k] = v
end
