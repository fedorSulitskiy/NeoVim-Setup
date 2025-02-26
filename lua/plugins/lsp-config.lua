return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				shell = "powershell",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls", -- Go
					"lua_ls", -- Lua
					"jedi_language_server", -- Python
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.gopls.setup({
                capabilities = capabilities,
            })
			lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
			lspconfig.jedi_language_server.setup({
                capabilities = capabilities,
            })
		end,
	},
}
