return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      sidebars = { "qf", "help", "terminal", "packer", "lspinfo" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd("colorscheme solarized-osaka")
    end,
  },
}
