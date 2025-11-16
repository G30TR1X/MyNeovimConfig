return {
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()

            require("mason").setup()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb", "cpptools" },
                automatic_setup = true,
            })

            local dap = require("dap")
            local dapui = require("dapui")

            dap.adapters.python = {
                type = "executable",
                command = os.getenv("HOME") .. "/.virtualenvs/tools/bin/python",
                args = { "-m", "debugpy.adapter" },
            }
            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return "/usr/bin/python"
                    end,
                },
            }

            dap.adapters.cppdbg = {
                id="cppdbg",
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7", -- adjust as needed, must be absolute path
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    setupCommands = {
                        {
                            text = '-enable-pretty-printing',
                            description =  'enable pretty printing',
                            ignoreFailures = false
                        },
                    },
                },
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<F5>", function()
                dap.continue()
            end)
            vim.keymap.set("n", "<F10>", function()
                dap.step_over()
            end)
            vim.keymap.set("n", "<F11>", function()
                dap.step_into()
            end)
            vim.keymap.set("n", "<F12>", function()
                dap.step_out()
            end)
            vim.keymap.set("n", "<Leader>b", function()
                dap.toggle_breakpoint()
            end)
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
    },
}
