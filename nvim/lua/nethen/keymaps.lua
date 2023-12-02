local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "0", "^", opts)
keymap("n", "^", "0", opts)

keymap("n", "v", "V", opts)
keymap("n", "V", "v", opts)

-- keymap ("n", "<leader>e", ":Lex 30<cr>", opts);
-- keymap ("n", "<leader>w", ":w<cr>", opts);
-- keymap ("n", "<leader>q", ":q<cr>", opts);
-- keymap ("n", "<leader>x", ":wq<cr>", opts);

-- keymap ("i", "<esc>", "<esc>l", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

vim.cmd([[
    autocmd! BufNewFile,BufRead *.tas nnoremap <Esc> :w<CR>
]])
