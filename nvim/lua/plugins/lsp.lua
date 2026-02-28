return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			vim.lsp.enable('pyright')
			vim.lsp.enable('ts_ls')
			vim.lsp.enable('clangd')
			vim.diagnostic.config({
				virtual_text = true,
				signs = true, -- Optional: show signs in the gutter
				underline = true,
				update_in_insert = false,
				severity_sort = false,
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require('mason').setup({})
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"ts_ls",
					"pyright"
				},
			})
		end,
	}
}
