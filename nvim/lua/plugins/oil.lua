return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name)
                    return name == ".git"
                end,
            },
            float = {
                padding = 2,
                max_width = 0.5,
                max_hight = 1,
                border = "rounded",
            },
        })

        vim.keymap.set("n", "<leader>e", ":lua require('oil').toggle_float()<CR>", { desc = "Telescope find files" })
    end,
}
