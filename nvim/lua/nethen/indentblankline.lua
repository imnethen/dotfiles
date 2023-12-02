local highlight = {
    "Whitespace",
}

vim.api.nvim_set_hl(0, "Whitespace", { fg = "#4c566a" })
-- vim.api.nvim_set_hl(0, "Whitespace", { fg = "#6272a4" })

require("ibl").setup {
    indent = { highlight = highlight },
    scope = {
        show_start = false,
        show_end = false,
    },
}
