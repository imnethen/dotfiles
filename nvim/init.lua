local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require "nethen/plugins"

require("lazy").setup(plugins)

require "nethen/options"
require "nethen/keymaps"

-- vim.cmd [[set rtp^="home/nethen/.opam/default/share/ocp-indent/vim"]]

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
-- vim.cmd([[autocmd FileType asm setlocal commentstring=//%s]])


vim.cmd "colorscheme catppuccin-macchiato"
