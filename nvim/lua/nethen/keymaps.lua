local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

keymap("n", "0", "^", opts)
keymap("n", "^", "0", opts)

keymap("n", "v", "V", opts)
keymap("n", "V", "v", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

keymap("n", "<space>n", "<cmd>lua require('wsnavigator').open_wsn()<cr>", opts)

vim.cmd([[
    autocmd! BufNewFile,BufRead *.tas nnoremap <Esc> :w<CR>
]])
