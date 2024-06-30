local options = {
	shiftwidth = 4,
	tabstop = 4,
	relativenumber = true,
	number = true,
	smartindent = true,
	scrolloff = 6,
	signcolumn = "number",
	whichwrap = "hl",
	expandtab = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[autocmd FileType * set formatoptions-=cro]])

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

-- vim.cmd "colorscheme catppuccin-macchiato"
vim.cmd "colorscheme everforest"
