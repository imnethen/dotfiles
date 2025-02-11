return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        version = "2.1.0",

        config = function()
            local whichkey = require "which-key"

            local setup = {
                plugins = {
                    presets = {
                        operators = false,
                        motions = false,
                        text_objects = true,
                        windows = true,
                        nav = true,
                        z = true,
                        g = true,
                    }
                },

                icons = {
                    breadcrumb = "»",
                    separator = "=>",
                    group = "+"
                },

                popup_mappings = {
                    scroll_down = "<C-j>",
                    scroll_up = "<C-k>",
                },

                window = {
                    border = "single",
                    position = "bottom",
                    -- TODO ?
                },

                layout = {
                    height = { min = 4, max = 25 },
                    width = { min = 20, max = 50 },
                    spacing = 3,
                    align = "left"
                },

                ignore_missing = false,
                hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

                show_help = true,
            }

            local opts = {
                mode = "n",
                prefix = "<leader>",
                buffer = nil,
                silent = true,
                noremap = true,
                nowait = true,
            }

            local mappings = {
                w = { "<cmd>w<cr>", "Save" },
                q = { "<cmd>q<cr>", "Quit" },
                Q = { "<cmd>q!<cr>", "Force quit" },
                x = { "<cmd>wq<cr>", "Save and quit" },
                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                e = { "<cmd>Lex 30<cr>", "Explorer" },
                -- t = { "<cmd>ToggleTerm<cr>", "Terminal" },
                o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
                ["/"] = { "<cmd>nohlsearch<cr>", "Clear selection" },
                y = { "ggVG\"+y", "Yank file to clipboard" },
                k = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open diagnostic window" },

                l = {
                    name = "LSP",
                    a = { "<cmd>lua vim.lsp.buf_code_action()<cr>", "Code action" },
                    d = {
                        "<cmd>Telescope diagnostics bufnr=0<cr>",
                        "Document diagnostics",
                    },
                    w = {
                        "<cmd>Telescope diagnostics<cr>",
                        "Workspace diagnostics",
                    },
                    f = { "<cmd>Format<cr>", "Format" },
                    i = { "<cmd>LspInfo<cr>", "LSP Info" },
                    j = {
                        "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
                        "Next diagnostic",
                    },
                    k = {
                        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
                        "Previous diagnostic",
                    },
                    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
                },
            }

            whichkey.setup(setup)
            -- whichkey.add(mappings)
            whichkey.register(mappings, opts)
        end
    }
}
