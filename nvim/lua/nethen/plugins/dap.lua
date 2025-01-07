return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "williamboman/mason.nvim"
        },

        config = function()
            local dap = require "dap"
            local dapui = require "dapui"


            dapui.setup{
                layouts = {
                    {
                        elements = {
                            {
                                id = "scopes",
                                size = 0.75
                            },
                            {
                                id = "breakpoints",
                                size = 0.25
                            }
                        },
                        position = "left",
                        size = 40,
                    }
                }
            }

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        vim.fn.input("path to bin: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}"
                }
            }

            require("dap-go").setup()
            require("nvim-dap-virtual-text").setup()

            vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "Breakpoint" })
            vim.keymap.set("n", "<space>dg", dap.run_to_cursor, { desc = "Run to cursor" })
            vim.keymap.set("n", "<space>dc", dap.continue, { desc = "Continue" })
            vim.keymap.set("n", "<space>de", function () dapui.eval(nil, { enter = true }) end, { desc = "Eval" })
            vim.keymap.set("n", "<space>ds", dap.step_into, { desc = "Step into" })
            vim.keymap.set("n", "<space>do", dap.step_out, { desc = "Step out" })
            vim.keymap.set("n", "<space>dn", "<cmd>DapNew<cr>", { desc = "DAP New" })
        end
    }
}
