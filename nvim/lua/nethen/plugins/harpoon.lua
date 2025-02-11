return {
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        keys = { "<space>a", "<space>h", "<space>t", "<C-n>", "<C-e>", "<C-p>" },

        config = function()
            local harpoon = require "harpoon"

            harpoon:setup()

            local conf = require("telescope/config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope/pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope/finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<space>a", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
            vim.keymap.set("n", "<space>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon normal list" })
            vim.keymap.set("n", "<space>t", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon telescope list" })

            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-e>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-p>", function() harpoon:list():select(3) end)
        end,
    }
}
