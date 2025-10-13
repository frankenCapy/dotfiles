-- Pyright Language Server Configuration
-- Type checking and intellisense for Python, works alongside Ruff
return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
      -- Also disable language services that Ruff handles
      disableTaggedHints = false,
    },
    python = {
      analysis = {
        -- Let Ruff handle linting, Pyright focuses on type checking
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "standard",

        -- Ignore specific directories to improve performance
        ignore = { "**/node_modules", "**/__pycache__", ".venv", "venv" },

        -- Enable stub package usage
        stubPath = "typings",

        diagnosticSeverityOverrides = {
          -- Type errors (keep these visible)
          reportGeneralTypeIssues = "warning",
          reportArgumentType = "warning",
          reportAttributeAccessIssue = "warning",

          -- Optional handling
          reportOptionalMemberAccess = "warning",
          reportOptionalSubscript = "warning",
          reportOptionalCall = "warning",
          reportOptionalIterable = "warning",
          reportOptionalContextManager = "warning",
          reportOptionalOperand = "warning",

          -- Unused code (Ruff can handle these too)
          reportUnusedImport = "none",
          reportUnusedVariable = "none",
          reportUnusedClass = "none",
          reportUnusedFunction = "none",

          -- Missing/incomplete type information
          reportMissingTypeStubs = "none",
          reportUnknownMemberType = "none",
          reportUnknownParameterType = "none",
          reportUnknownVariableType = "none",
          reportUnknownArgumentType = "none",
          reportUnknownLambdaType = "none",

          -- Import issues
          reportPrivateImportUsage = "warning",
          reportMissingImports = "error",

          -- Additional useful overrides
          reportIncompatibleMethodOverride = "warning",
          reportIncompatibleVariableOverride = "warning",
          reportUntypedFunctionDecorator = "none",
          reportUntypedClassDecorator = "none",
          reportUntypedBaseClass = "none",
          reportConstantRedefinition = "warning",
        },
      },
    },
  },
}
