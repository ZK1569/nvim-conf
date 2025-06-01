return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		cmdline = {
			view = "cmdline_popup",
		},
		messages = {
			view = "notify",
		},
		presets = {
			command_palette = true,
			lsp_doc_border = true,
		},
	},
}
