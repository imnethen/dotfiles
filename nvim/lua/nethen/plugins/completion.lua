return {
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        dependencies = {
            -- "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            -- "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            -- "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/luasnip",
            -- "rafamadriz/friendly-snippets",
        },

        config = function ()
            local cmp = require "cmp"
            -- local luasnip = require "luasnip"

            -- require("luasnip/loaders/from_vscode").lazy_load()

            local kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = " ",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = " ",
                Misc = " ",
            }

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = {
                    ["<C-space>"] = cmp.mapping.confirm { select = true },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            path = "[Path]",
                        })[entry.source.name]

                        return vim_item
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                window = {
                    documentation = {
                        border = "single",
                    }
                }
            }

        end
    }
}
