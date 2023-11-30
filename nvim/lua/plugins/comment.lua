return {
	"numToStr/Comment.nvim",
	opts = {
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	},
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	lazy = false,
}
