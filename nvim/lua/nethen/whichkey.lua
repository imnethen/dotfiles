local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        presets = {
            operators = false,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        }
    },

    key_labels = {
        -- override the labels for keys
    },

    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "=>", -- "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },

    popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
    },

    window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },

    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
    },

    ignore_missing = false,
    hidden = {},
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate

    show_help = true,
    triggers = "auto",
    triggers_blacklist = {
        -- list of mode / prefixes which should never be hooked by which_key
        -- for example i = { "j", "k" },
    },
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
    ["w"] = { "<cmd>w<cr>", "Save" },
    ["q"] = { "<cmd>q<cr>", "Quit" },
    ["Q"] = { "<cmd>q!<cr>", "Force quit" },
    ["x"] = { "<cmd>wq<cr>", "Save and quit" },
    ["f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["e"] = { "<cmd>Lex 30<cr>", "Explorer" },
    -- ["t"] = { "<cmd>ToggleTerm<cr>", "Terminal" },
    ["o"] = { "<cmd>Telescope oldfiles<cr>", "Old files" },
    ["/"] = { "<cmd>nohlsearch<cr>", "Clear selection" },

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

which_key.setup(setup)
which_key.register(mappings, opts)
