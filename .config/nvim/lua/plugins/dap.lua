local wk = require("which-key")

-- TODO: refactor to use https://github.com/jay-babu/mason-nvim-dap.nvim

return {
  {
    lazy = true,
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    }
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      wk.register({
        ["<F1>"] = { function() require "dapui".toggle() end, "dap ui" },
        ["<F2>"] = { function() require "dap".toggle_breakpoint() end, "breakpoint" },
        ['<F3>'] = { function() require "dap".set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
          "conditional breakpoint" },
        ['<F4>'] = { function() require "dap".set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
          "log point" },
        ['<F5>'] = { function() require "dap".continue() end, "continue" },
        ['<F6>'] = { function() require "dap".step_over() end, "step over" },
        ['<F7>'] = { function() require "dap".step_into() end, "step into" },
        ['<F8>'] = { function() require "dap".step_out() end, "step out" },
        ['<F9>'] = { function() require "dap".run_last() end, "run last" },
        ['<F10>'] = { function() require "dap".repl.open() end, "open REPL" },
      })

      wk.register({
        d = {
          name = "Debug",
          s = { ':lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)<CR>', "scopes" },
          f = { ':lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)<CR>', "frames" },
          p = { ':lua require("dap.ui.widgets").preview()<CR>', "preview" },
          h = { ':lua require("dap.ui.widgets").hover()<CR>', "hover" },
        }
      }, { prefix = "<leader>" })

      dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
        }
      }

      -- INFO: https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}"
        },
        {
          type = "delve",
          name = "Debug ENV PROD",
          request = "launch",
          program = "${file}",
          env = {
            ENVIRONMENT = "prod",
          }
        },
        {
          type = "delve",
          name = "Debug test", -- configuration for debugging test files
          request = "launch",
          mode = "test",
          program = "${file}"
        },
        -- works with go.mod packages and sub packages
        {
          type = "delve",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}"
        }
      }

      require("dapui").setup({
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = "",
            pause = "",
            play = " (F5)",
            run_last = " (F9)",
            step_back = " ",
            step_into = " (F7)",
            step_out = " (F8)",
            step_over = " (F6)",
            terminate = ""
          }
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" }
          }
        },
        force_buffers = true,
        icons = {
          collapsed = "",
          current_frame = "",
          expanded = ""
        },
        layouts = { {
          elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
          position = "left",
          size = 40
        }, {
          elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
          position = "bottom",
          size = 10
        } },
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t"
        },
        render = {
          indent = 1,
          max_value_lines = 100
        },
        windows = { indent = 1 },
      })

      -- custom debug signs
      vim.fn.sign_define('DapBreakpoint', {
        text = ' ',
        texthl = 'WarningMsg',
        linehl = '',
        numhl = 'WarningMsg'
      })
      vim.fn.sign_define('DapBreakpointRejected', {
        text = ' ',
        texthl = 'WarningMsg',
        linehl = '',
        numhl = 'WarningMsg'
      })
      vim.fn.sign_define('DapBreakpointCondition', {
        text = ' ',
        texthl = 'WarningMsg',
        linehl = '',
        numhl = 'WarningMsg'
      })
      vim.fn.sign_define('DapLogPoint', {
        text = ' ',
        texthl = 'WarningMsg',
        linehl = '',
        numhl = 'WarningMsg'
      })
      vim.fn.sign_define('DapStopped', {
        text = ' 󰁖',
        texthl = 'MoreMsg',
        linehl = 'SignColumn',
        numhl = 'MoreMsg'
      })
    end
  },
}
