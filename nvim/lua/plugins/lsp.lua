return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local has_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp-nvim-lsp")

      mason.setup()

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if has_cmp_lsp then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end

      mason_lspconfig.setup({
        ensure_installed = {
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "lua_ls",
          "clangd",
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
  },
}
