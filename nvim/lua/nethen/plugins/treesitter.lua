return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            -- TODO: get config for wgsl from old configs

            local configs = require "nvim-treesitter/configs"
            configs.setup {
                ensure_installed = "all",
                sync_intsall = false,
                highlight = { enable = true, disable = { "" } },
                -- TODO: check if good
                autopairs = { enable = false },
                indent = { enable = true },
                context_commentstring = { enable = false }
            }
            vim.cmd "TSEnable highlight"
        end
    }
}
