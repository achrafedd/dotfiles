return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			vim.lsp.enable('clangd')
			vim.lsp.enable('html')
			vim.lsp.enable('cssls')
			vim.lsp.enable('ts_ls')
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"html",
					"cssls",
					"ts_ls"
				},
			})
		end,
	}
}
