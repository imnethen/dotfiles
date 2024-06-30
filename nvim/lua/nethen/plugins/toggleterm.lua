return {
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        keys = "<C-/>",
        cmd = {
            "ToggleTerm",
            "ToggleTermSendCurentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
            "ToggleTermSetName",
            "ToggleTermToggleAll",
        },

        config = function()
            local toggleterm = require "toggleterm"

            toggleterm.setup {
                size = 20,
                open_mapping = "<C-/>",
                shade_filetypes = {},
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                pesist_size = true,
                direction = "float",
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "single",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal"
                    }
                }
            }
        end
    }
}
