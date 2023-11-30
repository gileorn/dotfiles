return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			render = "compact",
			stages = "static",
			timeout = 1000,
		})

		-- vim.notify = notify

		local banned_messages = { "No information available" }

		vim.notify = function(msg, ...)
			for _, banned in ipairs(banned_messages) do
				if msg == banned then
					return
				end
			end
			notify(msg, ...)
		end
	end,
}
