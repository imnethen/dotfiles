local M = {}

vim.filetype.add( {extension = { wgsl = "wgsl" } } )

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wgsl = {
    install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = { "src/parser.c" },
    },
}

function M.config()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
        ensure_installed = "all",
        ignore_install = { "" },

        sync_install = false,

        highlight = {
            enable = true,
            disable = { "" },
        },
        autopairs = {
            enable = false,
        },
        indent = { enable = true, disable = { "" } },

        context_commentstring = {
            enable = false,
            enable_autocmd = false,
        },
    }
end


return M
