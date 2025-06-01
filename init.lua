local orig = vim.ui.input
vim.ui.input = function(opts, on_confirm)
	print("↪ snacks: vim.ui.input appelé")
	return orig(opts, on_confirm)
end

require("zk.core")
require("zk.lazy")
