return {
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     lazy = false,
    --     -- branch = "main",
    --     branch = "master",
    --     build = ":TSUpdate",

    --     config = function()
    --         -- TODO: get config for wgsl from old configs

    --         local configs = require "nvim-treesitter/configs"
    --         configs.setup {
    --             ensure_installed = { "rust" },
    --             highlight = { enable = true },
    --             -- TODO: check if good
    --             autopairs = { enable = false },
    --             indent = { enable = true },
    --             context_commentstring = { enable = false, enable_autocmd = false }
    --         }
    --         vim.cmd "TSEnable highlight"
    --     end
    -- }
}
