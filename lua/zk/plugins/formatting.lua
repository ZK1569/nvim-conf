return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },

				lua = { "stylua" },
				python = { "autopep8" },
				go = { "gofmt" },
				zig = { "zigfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt", lsp_format = "fallback" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},

			formatters = {
				prettierd = {
					prepend_args = { "--tab-width", "4" },
				},
				prettier = {
					prepend_args = { "--tab-width", "4" },
				},
				stylua = {
					prepend_args = { "--indent-width", "4" },
				},
				clang_format = {
					prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
				},
				gofmt = {},
				zigfmt = {},
			},
		})
	end,
}
