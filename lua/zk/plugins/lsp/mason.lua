return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		mason_tool_installer = require("mason-tool-installer")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"bashls",
				"clangd",
				"dockerls",
				"docker_compose_language_service",
				"jsonls",
				"zk", -- for markdown
				"powershell_es",
				"pyre", -- for python
				"rust_analyzer",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				"eslint_d",
			},
		})
	end,
}
