return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    -- require("dapui").setup()

    dap.adapters.ruby = {
      type = "server",
      host = "127.0.0.1",
      port = 38698
      -- executable = {
      --   command = "bundle",
      --   args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
      --     "-c", "--", "bundle", "exec", config.command, config.script,
      --   },
      -- },
      --
      -- type = "executable",
      -- command = "rdbg",
      -- args = { "-n", "--open", "--port", "38698", "-c", "--", "ruby" },
    }
    dap.configurations.ruby = {
      {
        type = "ruby",
        request = "attach",
        name = "Rails in Lando",
        host = "127.0.0.1",
        port = 38698,
        cwd = "${workspaceFolder}",
        pathMappings = {
          -- Map the path in the container to your local path
          -- Format: ["/path/in/container"] = "/path/on/host"
          ["/app"] = "${workspaceFolder}"
        }
      },
      {
        type = "ruby",
        request = "launch",
        name = "Run this file",
        program = "${file}",
        useBundler = false,
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
  keys = {
    { "<leader>dc", function() require("dap").continue() end,   desc = "DAP Connect" },
    { "<leader>dc", function() require("dap").disconnect() end, desc = "DAP Disconnect" },
    { "<leader>dl", function() require("dapui").toggle() end,   desc = "DAP UI toggle" }
    -- vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
    -- vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
    -- vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
    -- vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
    -- vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
    -- vim.keymap.set("n", "<Leader>lp",
    --   function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
    -- vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end)
    -- vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end)
  }
}
