function vim.g.CrystallineStatuslineFn(winnr)
    local cl = require "crystalline"
    local s = ""

    s = s .. cl.HiItem("A")

    s = s .. " %f%h%w%m%r "

    s = s .. cl.Sep(0, "A", "Fill")

    s = s .. "%="

    s = s .. cl.Sep(1, "Fill", "A")

    s = s .. "%{&ft} %l/%L %2v "

    return s
end

vim.o.laststatus = 2
-- vim.g.crystalline_theme = "gruvbox"
vim.g.crystalline_theme = "dracula"
