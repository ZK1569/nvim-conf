return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-- keybindings sur LspAttach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
				keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
				keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
				keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			end,
		})

		-- capacités pour cmp-nvim-lsp
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- diagnostics signs
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				source = "always",
				border = "rounded",
			},
		})

		mason.setup()

		mason_lspconfig.setup({
			automatic_installation = true,
			handlers = {
				-- handler par défaut
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- configuration spécifique pour lua_ls
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,
			},
		})
	end,
}
