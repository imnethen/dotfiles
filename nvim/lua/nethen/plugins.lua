-- TODO: use undotree
require "paq" {
	"savq/paq-nvim",

    -- colorschemes
    "NTBBloodbath/doom-one.nvim",
    "maxmx03/dracula.nvim",
    "shaunsingh/nord.nvim",
    "ellisonleao/gruvbox.nvim",
    "catppuccin/nvim",
    "sainnhe/everforest",

    -- yes
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "ggandor/leap.nvim",
    "windwp/nvim-autopairs",
    "nvim-telescope/telescope.nvim",
    "burntsushi/ripgrep",
    "nvim-treesitter/nvim-treesitter",
    "akinsho/toggleterm.nvim",
    "folke/which-key.nvim",
    "unblevable/quick-scope",
    "rbong/vim-crystalline",
    "lukas-reineke/indent-blankline.nvim",

    -- languages
    "tikhomirov/vim-glsl",
    "szebniok/tree-sitter-wgsl",
    "tidalcycles/vim-tidal",
    "imnethen/celestetas.nvim",

    -- cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/luasnip",
    "rafamadriz/friendly-snippets",

    -- lsp
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mhartington/formatter.nvim",
}

-- automatically sync plugins when this file is saved
vim.cmd([[
	augroup paq_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PaqSync
	augroup end
]])

-- quickscope colorscheme
vim.cmd([[
    augroup qs_colors
        autocmd!
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#88ddff' gui=underline
        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ababab' gui=underline
    augroup END
]])

-- format on filesave
vim.cmd([[
    augroup auto_format
        autocmd!
        autocmd BufWritePost * FormatWrite
    augroup END
]])

vim.cmd([[autocmd FileType glsl setlocal commentstring=//%s]])
vim.cmd([[autocmd FileType vert setlocal commentstring=//%s]])
vim.cmd([[autocmd FileType frag setlocal commentstring=//%s]])
vim.cmd([[autocmd FileType cpp setlocal commentstring=//%s]])
vim.cmd([[autocmd FileType tas setlocal commentstring=#%s]])


-- vim.cmd([[colorscheme dracula]])
vim.cmd "colorscheme gruvbox"
