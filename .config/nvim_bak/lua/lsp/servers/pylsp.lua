local M = {}

M.settings = {
  pylsp = {
    configurationSources = { "flake8" },
    plugins = {
      -- formatter options
      black = { enabled = false },
      autopep8 = { enabled = true, args = { "--max-line-length", "120" } },
      yapf = { enabled = false },
      -- linter options
      pylint = { enabled = true, executable = "pylint", args = { "--max-line-length", "120" } },
      pyflakes = { enabled = false },
      pycodestyle = { maxLineLength = 120 },
      flake8 = { enabled = true, maxLineLength = 120 },
      mccabe = { enabled = false },
      -- type checker
      pylsp_mypy = { enabled = true },
      -- auto-completion options
      jedi_completion = { fuzzy = true },
      -- import sorting
      pyls_isort = { enabled = true },
    }
  }
}

return M
