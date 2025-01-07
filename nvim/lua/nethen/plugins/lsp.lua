-- TODO: rewrite everything because handler stuff is stupid !
return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "mhartington/formatter.nvim",
            "hrsh7th/cmp-nvim-lsp",
            -- "sputnick1124/uiua.vim",
        },

        config = function()
            local cmp_nvim_lsp = require "cmp_nvim_lsp"

            local caps
            caps = vim.lsp.protocol.make_client_capabilities()
            caps = cmp_nvim_lsp.default_capabilities(caps)
            -- handlers.capabilities = vim.lsp.protocol.make_client_capabilities()
            -- handlers.capabilities = cmp_nvim_lsp.default_capabilities(handlers.capabilities)

            -- mason config
            local servers = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "gopls",
                "pylsp",
                "zls",
                "clojure_lsp",
                "ocamllsp",
            }

            local settings = {
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

            require("mason").setup(settings)
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = true
            })

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

            local lspconfig = require "lspconfig"
            local opts = {
                on_attach = function(_, bufnr)
                    lsp_keymaps(bufnr)
                end,
                capabilities = caps
            }

            for _, server in pairs(servers) do
                lspconfig[server].setup(opts)
            end

            -- uiua and wgsl setup
            lspconfig["uiua"].setup({
                on_attach = opts.on_attach,
                capabilities = caps,
                cmd = { "uiua", "lsp" }
            })

            lspconfig["wgsl_analyzer"].setup({
                on_attach = opts.on_attach,
                capabilities = caps,
                cmd = { "wgsl_analyzer" },
                root_dir = lspconfig.util.root_pattern "*"
            })

            lspconfig["clangd"].setup({
                on_attach = opts.on_attach,
                capabilities = caps,
                cmd = { "clangd" },
                root_dir = lspconfig.util.root_pattern "*"
            })

            -- lspconfig["ocamllsp"].setup({
            --     on_attach = opts.on_attach,
            --     capabilities = caps,
            --     cmd = { "ocamllsp" },
            --     root_dir = lspconfig.util.root_pattern "*"
            -- })

            -- not mason config
            local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end

            local config = {
                virtual_text = true,
                signs = { active = signs },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    -- TODO: ?
                    focusable = true,
                    style = "minimal",
                    border = "single",
                    source = "always",
                    header = "",
                    prefix = "",
                }
            }

            vim.diagnostic.config(config)

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "single",
            })

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "single",
            })

            require ("formatter").setup {
                logging = true,
                log_level = vim.log.levels.warn,

                filetype = {
                    go = { require ("formatter/filetypes/go").goimports },
                    rust = { require ("formatter/filetypes/rust").rustfmt },
                    ocaml = { require ("formatter/filetypes/ocaml").ocamlformat },
                    ["*"] = { require ("formatter/filetypes/any").remove_trailing_whitespace },

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
                }
            }
        end
    }
}
