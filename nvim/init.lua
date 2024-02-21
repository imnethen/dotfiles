require "nethen/options"
require "nethen/keymaps"
require "nethen/crystalline"
require "nethen/plugins"
require "nethen/cmp"
require "nethen/lsp"
require "nethen/autopairs"
require "nethen/telescope"
require "nethen/toggleterm"
require "nethen/treesitter".config()
require "leap".add_default_mappings()
require "nethen/whichkey"
require "nethen/indentblankline"
require "oil".setup()

vim.cmd([[set rtp^="/home/nethen/.opam/default/share/ocp-indent/vim"]])
