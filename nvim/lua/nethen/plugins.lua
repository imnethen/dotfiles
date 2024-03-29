-- TODO: organize better
local plugins = {
    -- colorschemes
    {
        "NTBBloodbath/doom-one.nvim",
        lazy = true
    },
    {
        "maxmx03/dracula.nvim",
        lazy = true
    },
    {
        "shaunsingh/nord.nvim",
        lazy = true
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true
    },
    {
        "sainnhe/everforest",
        lazy = true
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority=1000
    },

    -- yes
    {
        "nvim-lua/popup.nvim",
        lazy = true,
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "tpope/vim-surround",
        lazy = true,
        keys = {
            "ys",
            "ds",
            "cs",
        }
    },
    {
        "tpope/vim-commentary",
        lazy = true,
        keys = { { "gc", mode = { "n", "v" } } },
        cmd = "Commentary"
    },
    {
        "ggandor/leap.nvim",
        lazy = true,
        keys = {
            "s",
            "S",
            "gs"
        },

        config = function ()
            require "leap".add_default_mappings()
        end
    },
    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "InsertEnter",
        config = function ()
            require "nethen/autopairs"
        end
    },
    -- {
    --     "nvim-telescope/telescope-fzf-native.nvim",
    --     build = "make",
    --     lazy = true,
    -- },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        config = function ()
            require "nethen/telescope"
        end,

        dependencies = {
            -- this doesnt work i think idk weh
            "nvim-telescope/telescope-fzf-native.nvim",
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            require "nethen/treesitter".config()
        end
    },
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
        config = function ()
            require "nethen/toggleterm"
        end
    },
    {
        "folke/which-key.nvim",
        config = function ()
            require "nethen/whichkey"
        end
    },
    "unblevable/quick-scope",
    -- "rbong/vim-crystalline",
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
            require "nethen/indentblankline"
        end
    },
    {
        "stevearc/oil.nvim",
        lazy = false,
        priority = 100,
        config = true
    },
    -- "HiPhish/rainbow-delimiters.nvim",
    -- "rrethy/vim-illuminate",
    {
        "romainl/vim-cool",
        lazy = true,
        keys = { "/", "n", "N" },
    },

    -- languages
    {
        "tikhomirov/vim-glsl",
        ft = "glsl"
    },
    {
        "szebniok/tree-sitter-wgsl",
        ft = "wgsl"
    },
    "imnethen/celestetas.nvim",
    -- "elkowar/yuck.vim",

    -- cmp
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        -- event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/luasnip",
            "rafamadriz/friendly-snippets",
        },

        config = function ()
            require "nethen/cmp"
        end
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "nethen/lsp"
        end
    },
    -- can't lazy load these
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mhartington/formatter.nvim",
}

return plugins
