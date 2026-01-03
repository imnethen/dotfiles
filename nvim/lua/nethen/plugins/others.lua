return {
    {
        "tpope/vim-surround",
        keys = {
            "ys",
            "ds",
            "cs",
        }
    },
    {
        "tpope/vim-commentary",
        keys = { { "gc", mode = { "n", "v" } } },
        cmd = "Commentary"
    },
    {
        "ggandor/leap.nvim",
        keys = {
            "s",
            "S",
            "gs"
        },

        config = function()
            require "leap".add_default_mappings()
        end
    },
    {
        "unblevable/quick-scope",
        lazy = false,

        config = function()
            vim.cmd [[
                augroup qs_colors
                    autocmd!
                    autocmd ColorScheme * highlight QuickScopePrimary guifg='#ffffff' gui=underline
                    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ababab' gui=underline
                augroup END
            ]]
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require("ibl").setup {
                scope = {
                    show_start = false,
                    show_end = false,
                }
            }
        end
    },

    -- {
    --     "JohanChane/wsnavigator.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("wsnavigator").setup {
    --             ui = {
    --                 float = {
    --                     border = "single",
    --                     float_hl = "single",
    --                     border_hl = "single",
    --                 },
    --             },
    --         }
    --     end,
    -- },

    -- TODO: oil config?
    {
        "stevearc/oil.nvim",
        lazy = false,
        priority = 100,
        config = true
    },
    {
        "romainl/vim-cool",
        keys = { "/", "n", "N", ":" },
    },
    {
        "tikhomirov/vim-glsl",
        ft = "glsl"
    },
    {
        "laurelmay/riscv.vim",
        ft = "riscv"
    },
    -- {
    --     "szebniok/tree-sitter-wgsl",
    --     ft = "wgsl"
    -- },
    -- {
    --     "imnethen/celestetas.nvim",
    --     ft = "tas"
    -- },

    {
        "RaafatTurki/hex.nvim",
        -- TODO: lazy
        config = function()
            require 'hex'.setup {

              -- cli command used to dump hex data
              dump_cmd = 'xxd -g 1 -u',

              -- cli command used to assemble from hex data
              assemble_cmd = 'xxd -r',

              -- function that runs on BufReadPre to determine if it's binary or not
              is_buf_binary_pre_read = function()
                -- logic that determines if a buffer contains binary data or not
                -- must return a bool
              end,

              -- function that runs on BufReadPost to determine if it's binary or not
              is_buf_binary_post_read = function()
                -- logic that determines if a buffer contains binary data or not
                -- must return a bool
              end,
            }
        end
    },

    {
        "mhartington/formatter.nvim",
        cmd = { "Format", "FormatLock", "FormatWrite", "FormatWriteLock" },
        config = function()
            require("formatter").setup {
                logging = true,
                log_level = vim.log.levels.warn,

                filetype = {
                    go = { require("formatter/filetypes/go").goimports },
                    rust = { require("formatter/filetypes/rust").rustfmt },
                    ocaml = { require("formatter/filetypes/ocaml").ocamlformat },
                    tas = {
                        {
                            exe = "/home/nethen/.local/share/nvim/lazy/celestetas.nvim/bin/fmt/tasfmt",
                            stdin = true,
                        }
                    },
                    uiua = {
                        {
                            exe = "/sbin/uiua",
                            args = { "fmt" },
                            -- stdin = true
                        }
                    },
                    clojure = {
                        {
                            exe = "~/.local/share/nvim/mason/bin/zprint",
                            stdin = true,
                        }
                    },
                    ["*"] = { require("formatter/filetypes/any").remove_trailing_whitespace },
                }
            }
        end
    },
    {
        "lervag/vimtex",
        ft = "tex",

        config = function()
            vim.g.vimtex_view_general_viewer = "zathura"
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown"
    },
    {
        "ya2s/nvim-cursorline",
        event = "VeryLazy",
        opts = {
            cursorline = {
                enabled = true,
                timeout = 0,
                number = false,
            },
            cursorword = { enabled = false }
        }
    }
}
