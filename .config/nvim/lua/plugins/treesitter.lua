return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    vim.opt.runtimepath:prepend("$HOME/.local/share/treesitter")

    require 'nvim-treesitter.configs'.setup {
      parser_install_dir = "$HOME/.local/share/treesitter",
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "go", "javascript", "typescript", "json", "html", "json", "markdown", "python" },
      modules = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      indent = { enable = true },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
