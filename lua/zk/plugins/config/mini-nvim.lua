require("mini.ai").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.bufremove").setup({})
require("mini.notify").setup({
	content = {
		sort = function(notify_array)
			local filtered = vim.tbl_filter(function(notif)
				return not (
					notif.data
					and notif.data.source == "lsp_progress"
					and notif.data.client_name == "basedpyright"
				)
			end, notify_array)
			return require("mini.notify").default_sort(filtered)
		end,
	},
})
require("mini.icons").setup({})
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "▎", change = "▎", delete = "▎" },
	},
})
require("mini.git").setup({})
require("mini.input").setup({})

vim.keymap.set("n", "<leader>hp", function()
	require("mini.diff").toggle_overlay()
end, { desc = "Preview diff overlay" })
