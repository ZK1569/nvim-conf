-- INFO: catppuccin theme
-- return {
-- 	"catppuccin/nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha",
-- 		})
--
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }

-- INFO: tokyonight theme
return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			-- style = "moon",
			style = "night",
		})

		vim.cmd("colorscheme tokyonight")
	end,
}

-- INFO: 🌊 KANAGAWA.nvim 🌊
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({})
-- 		vim.cmd("colorscheme kanagawa-dragon")
-- 	end,
-- }
