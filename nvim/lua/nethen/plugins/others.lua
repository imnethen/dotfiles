return {
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
        "unblevable/quick-scope",
    },
    -- TODO: oil config?
    {
        "stevearc/oil.nvim",
        lazy = false,
        priority = 100,
        config = true
    },
    {
        "romainl/vim-cool",
        lazy = true,
        keys = { "/", "n", "N" },
    },
    {
        "tikhomirov/vim-glsl",
        ft = "glsl"
    },
    -- {
    --     "szebniok/tree-sitter-wgsl",
    --     ft = "wgsl"
    -- },
    "imnethen/celestetas.nvim",
}
