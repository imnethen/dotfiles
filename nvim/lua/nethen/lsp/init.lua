local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "nethen/lsp/mason"
require "nethen/lsp/handlers".setup()
require "nethen/lsp/formatter"
