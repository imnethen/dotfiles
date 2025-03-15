return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",

        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                    border = "single",
                    icons = {
                        package_installed = "<>",
                        package_pending = "..",
                        package_uninstalled = "</>",
                    },
                    },
                    log_level = vim.log.levels.INFO,
                    max_concurrent_installers = 4,
                }
            },
            {
                "saghen/blink.cmp",

                dependencies = "rafamadriz/friendly-snippets",

                version = "*",

                opts = {
                    keymap = { preset = "default" },

                    completion = {
                        list = {
                            selection = { preselect = true, auto_insert = false }
                        },
                    },

                    appearance = {
                        use_nvim_cmp_as_default = true,
                        nerd_font_variant = "mono",
                    },

                    sources = {
                        default =  { "lsp", "path", "snippets", "buffer" },
                    },

                    signature = {
                        enabled = true,
                        window = {
                            show_documentation = false,
                            border = "single",
                        }
                    },
                },
                opts_extend = { "sources.default" },
            },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        config = function()
            local blink = require "blink.cmp"
            local lspconfig = require "lspconfig"

            local servers = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "pylsp",
                "zls",
                "clojure_lsp",
                "ocamllsp",
                "csharp_ls",

                "uiua",
                "wgsl_analyzer",
                "clangd",
            }

            -- TODO: not do this ?? this seems stupid
            local function lsp_keymaps(bufnr)
                local opts = { noremap = true, silent = true }
                local keymap = vim.api.nvim_buf_set_keymap
                keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
                -- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
                keymap(bufnr, "n", "<leader>lf", "<cmd>Format<cr>", opts)
                keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
                keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
                keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
                keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
                keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
                keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
            end

            local caps = blink.get_lsp_capabilities()

            local default_config = {
                on_attach = function(_, bufnr)
                    lsp_keymaps(bufnr)
                end,
                capabilities = caps,
            }

            local server_configs = {
                uiua = vim.tbl_extend("keep", default_config, {
                    cmp = { "uiua", "lsp" },
                }),
                wgsl_analyzer = vim.tbl_extend("keep", default_config, {
                    cmd = { "wgsl_analyzer" },
                    root_dir = lspconfig.util.root_pattern "*"
                }),
                clangd = vim.tbl_extend("keep", default_config, {
                    cmd = { "clangd" },
                    root_dir = lspconfig.util.root_pattern "*"
                }),
                ocamllsp = vim.tbl_extend("keep", default_config, { -- TODO: check this
                    cmd = { "ocamllsp" },
                    root_dir = lspconfig.util.root_pattern "*"
                })
            }

            for _, server in pairs(servers) do
                lspconfig[server].setup(server_configs[server] or default_config)
            end

            vim.diagnostic.config({ float = { border = "single" } })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "single",
            })
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "single",
            })
        end
    }
}
