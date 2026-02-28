return {
	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true,
			integrations = {
				notify = true,
				cmp = true,
				gitsigns = true,
			},
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			custom_highlights = function(colors)
				return {
					WinSeparator = { fg = colors.flamingo },
				}
			end
		})
		local ctp = require("catppuccin.palettes").get_palette("mocha") -- or your flavor

		vim.api.nvim_set_hl(0, "Pmenu", { bg = ctp.base, fg = ctp.text })
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = ctp.surface1, fg = ctp.text })
		vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = ctp.base, fg = ctp.overlay0 })
		vim.cmd('colorscheme catppuccin')
	end
}
