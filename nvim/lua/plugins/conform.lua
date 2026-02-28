return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- lua = { "stylua" },
				-- python = { "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				-- rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettier"},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 200,
				lsp_format = "fallback",
			},
		})
	end
}
