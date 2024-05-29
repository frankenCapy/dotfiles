local M = {}

local filetypes = {
  "gohtml", "html", "markdown", "mdx", "mustache", "css", "less", "postcss", "sass",
  "scss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact"
}

local init_options = {
  userLanguages = {
    eelixir = "html-eex",
    eruby = "erb"
  }
}

local settings = {
  tailwindCSS = {
    classAttributes = { "class", "className", "classList", "ngClass" },
    lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidConfigPath = "error",
      invalidScreen = "error",
      invalidTailwindDirective = "error",
      invalidVariant = "error",
      recommendedVariantOrder = "warning"
    },
    validate = true
  }
}

M.filetypes = filetypes;
M.settings = settings;
M.init_options = init_options;

return M;
