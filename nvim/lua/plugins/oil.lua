return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup({
      default_file_explorer = true,
      columns = {
        "icon",
        "permissions",
        "size",
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          return name == ".git"
        end,
      },
      float = {
        padding = 2,
        max_width = 0.6,
        max_height = 0.8,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        preview_split = "auto",
        override = function(conf)
          return conf
        end,
      },
    })
    vim.keymap.set("n", "sf", ":lua require('oil').toggle_float()<CR>", { desc = "Telescope find files" })
  end

}
