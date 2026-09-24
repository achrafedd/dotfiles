return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          file_ignore_patterns = {
            "node_modules",
            "%.git/",
            "%.next/",
            "dist/",
            "build/",
            "target/",
            "vendor/",
            "%.lock",
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!**/.git/*",
            "--glob=!**/node_modules/*",
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = {
              "fd",
              "--type",
              "f",
              "--strip-cwd-prefix",
              "--hidden",
              "--exclude",
              ".git",
              "--exclude",
              "node_modules",
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "lazygit")

      local keymap = vim.keymap.set

      -- devaslife signature semicolon (;) Telescope keymaps
      keymap("n", ";f", function()
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end, { desc = "Find Files" })

      keymap("n", ";r", function()
        builtin.live_grep()
      end, { desc = "Live Grep" })

      keymap("n", ";b", function()
        builtin.buffers()
      end, { desc = "Find Buffers" })

      keymap("n", ";t", function()
        builtin.help_tags()
      end, { desc = "Help Tags" })

      keymap("n", ";;", function()
        builtin.resume()
      end, { desc = "Resume Last Search" })

      keymap("n", ";e", function()
        builtin.diagnostics()
      end, { desc = "Diagnostics" })
    end,
  },
}
