return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			render = "compact",
			stages = "static",
			timeout = 1000,
		})

		vim.notify = notify
	end,
}
