return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "rounded",
          devicon = true,
          foldericon = true,
        },
        hover = {
          max_width = 0.6,
          open_link = "gx",
        },
        diagnostic = {
          show_code_action = true,
          show_source = true,
          jump_num_shortcut = true,
        },
        code_action = {
          num_shortcut = true,
          show_server_name = true,
          extend_gitsigns = true,
        },
        lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = true,
        },
      })

      local keymap = vim.keymap.set
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Hover Doc" })
      keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true, desc = "LSP Finder" })
      keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true, desc = "Peek Definition" })
      keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true, desc = "Goto Definition" })
      keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, desc = "Code Action" })
      keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "Rename" })
      keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, desc = "Prev Diagnostic" })
      keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, desc = "Next Diagnostic" })
      keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true, desc = "Toggle Outline" })
    end,
  },
}
