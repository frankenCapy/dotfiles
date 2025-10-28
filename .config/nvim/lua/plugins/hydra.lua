return {
  'nvimtools/hydra.nvim',
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    local Hydra = require('hydra')

    -- Global state for diagnostic dimming
    vim.g.diagnostics_dimmed = true
    local hint = [[
  ^ ^        Options
  ^
  _v_ %{ve} virtual edit
  _b_ %{bg} light background
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number
  _s_ %{scl} sign column always visible
  _d_ %{dim} dim diagnostics
  _l_ %{cc} colorcolumn (line length hint)
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
    funcs.dim = function()
      if vim.g.diagnostics_dimmed then
        return '[x]'
      else
        return '[ ]'
      end
    end
    funcs.cc = function()
      if vim.o.colorcolumn == '' then
        return '[ ]'
      else
        return '[x]'
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
        { 'd', function()
          vim.g.diagnostics_dimmed = not vim.g.diagnostics_dimmed
          if vim.g.diagnostics_dimmed then
            -- Apply dimmed colors
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', {
              fg = '#5e4444',
              italic = true,
            })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', {
              fg = '#5e5438',
              italic = true,
            })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', {
              fg = '#44485e',
              italic = true,
            })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', {
              fg = '#445e52',
              italic = true,
            })
          else
            -- Apply full brightness colors
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', {
              fg = '#f38ba8',
              italic = true,
            })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', {
              fg = '#f9e2af',
              italic = true,
            })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', {
              fg = '#89b4fa',
              italic = true,
            })
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', {
              fg = '#94e2d5',
              italic = true,
            })
          end
        end, { desc = 'dim diagnostics' } },
        { 'l', function()
          if vim.o.colorcolumn == '' then
            vim.o.colorcolumn = '120'
          else
            vim.o.colorcolumn = ''
          end
        end, { desc = 'colorcolumn' } },
        { '<Esc>', nil, { exit = true } },
      }
    })
  end
}
