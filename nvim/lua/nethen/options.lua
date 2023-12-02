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
