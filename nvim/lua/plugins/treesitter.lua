return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	-- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects",
	-- },
	config = function()
		require("nvim-treesitter").setup({
			{
				highlight = { enable = true },
				textobjects = { enable = true },
			}
		})
	end,
}
