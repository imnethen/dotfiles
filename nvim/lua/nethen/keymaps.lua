local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<space>", "<Nop>", opts)

keymap("n", "0", "^", opts)
keymap("n", "^", "0", opts)

keymap("n", "v", "V", opts)
keymap("n", "V", "v", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

keymap("n", "-", "<cmd>Oil<cr>", opts)

vim.cmd([[
    autocmd! BufNewFile,BufRead *.tas nnoremap <Esc> :w<CR>
]])
