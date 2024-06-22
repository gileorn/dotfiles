return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "frappe",
		custom_highlights = function(colors)
			return {
				FlashCurrent = { bg = colors.peach, fg = colors.base },
				FlashMatch = { bg = colors.lavender, fg = colors.base },
				FlashLabel = { bg = colors.green, fg = colors.base, bold = true },
			}
		end,
	},
}
