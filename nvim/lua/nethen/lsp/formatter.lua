require "formatter".setup {
    logging = true,
    log_level = vim.log.levels.WARN,

    filetype = {
        go = {
            require("formatter.filetypes.go").goimports,
        },

        rust = {
            require("formatter.filetypes.rust").rustfmt,
        },

        tas = {
            {
                -- exe = "~/Code/tasfmt/tasfmt",
                exe = "~/.local/share/nvim/site/pack/paqs/start/celestetas.nvim/bin/fmt/tasfmt",
                stdin = true,
            }
        },

        clojure = {
            {
                exe = "~/.local/share/nvim/mason/bin/zprint",
                stdin = true,
            }
        },

        ocaml = {
            require("formatter.filetypes.ocaml").ocamlformat
        },

        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
