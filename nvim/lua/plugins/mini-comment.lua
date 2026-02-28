return {
	'nvim-mini/mini.nvim',
	config = function()
		require("mini.comment").setup({
			mappings = {
				-- Toggle comment (like `gcip` - comment inner paragraph) for both
				-- Normal and Visual modes
				comment = '<C-/>',

				-- Toggle comment on current line
				comment_line = '<C-/>',

				-- Toggle comment on visual selection
				comment_visual = '<C-/>',

				textobject = '<C-/>',
			},
		})
	end,
}
