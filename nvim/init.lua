-- vim.cmd [[set rtp^=/home/nethen/.opam/default/share/ocp-indent/vim]]

vim.g.mapleader = " "
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

require("lazy").setup("nethen/plugins")

require "nethen/options"
require "nethen/keymaps"


-- temp fix for rust analyzer
-- for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
--     local default_diagnostic_handler = vim.lsp.handlers[method]
--     vim.lsp.handlers[method] = function(err, result, context, config)
--         if err ~= nil and err.code == -32802 then
--             return
--         end
--         return default_diagnostic_handler(err, result, context, config)
--     end
-- end
