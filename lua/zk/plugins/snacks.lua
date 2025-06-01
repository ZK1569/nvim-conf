return {
	"folke/snacks.nvim",
	priority = 1001,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		scroll = { enabled = true },
	},
}
