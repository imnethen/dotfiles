return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            -- TODO: get config for wgsl from old configs

            local configs = require "nvim-treesitter/configs"
            configs.setup {
                ensure_installed = "all",
                sync_install = false,
                highlight = { enable = true },
                -- TODO: check if good
                autopairs = { enable = false },
                indent = { enable = true },
                context_commentstring = { enable = false, enable_autocmd = false }
            }
            vim.cmd "TSEnable highlight"
        end
    }
}
