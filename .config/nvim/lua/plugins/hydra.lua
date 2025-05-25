return {
  'nvimtools/hydra.nvim',
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    local Hydra = require('hydra')
    local hint = [[
  ^ ^        Options
  ^
  _v_ %{ve} virtual edit
  _b_ %{bg} light background
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number
  _s_ %{scl} sign column always visible
  ^
       ^^^^                _<Esc>_
]]

    local funcs = {}
    funcs.scl = function()
      if vim.o.signcolumn == 'auto' then
        return '[ ]'
      else
        return '[x]'
      end
    end
    funcs.bg = function()
      if vim.o.background == 'light' then
        return '[x]'
      else
        return '[ ]'
      end
    end

    Hydra({
      name = 'Options',
      hint = hint,
      config = {
        color = 'amaranth',
        invoke_on_body = true,
        hint = {
          position = 'middle',
          funcs = funcs,
        }
      },
      mode = { 'n', 'x' },
      body = '<leader>o',
      heads = {
        { 'n', function()
          if vim.o.number == true then
            vim.o.number = false
          else
            vim.o.number = true
          end
        end, { desc = 'number' } },
        { 'r', function()
          if vim.o.relativenumber == true then
            vim.o.relativenumber = false
          else
            vim.o.number = true
            vim.o.relativenumber = true
          end
        end, { desc = 'relativenumber' } },
        { 'v', function()
          if vim.o.virtualedit == 'all' then
            vim.o.virtualedit = 'block'
          else
            vim.o.virtualedit = 'all'
          end
        end, { desc = 'virtualedit' } },
        { 'c', function()
          if vim.o.cursorline == true then
            vim.o.cursorline = false
          else
            vim.o.cursorline = true
          end
        end, { desc = 'cursor line' } },
        { 'b', function()
          if vim.o.background == "light" then
            vim.o.background = "dark"
          else
            vim.o.background = "light"
          end
        end, { desc = 'background' } },
        { 's', function()
          if vim.o.signcolumn == "auto" then
            vim.o.signcolumn = "yes"
          else
            vim.o.signcolumn = "auto"
          end
        end, { desc = 'signcolumn' } },
        { '<Esc>', nil, { exit = true } },
      }
    })
  end
}
