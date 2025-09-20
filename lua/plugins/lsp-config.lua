return {
	-- 1. Disable the Mason-related plugins
	{ "williamboman/mason.nvim", enabled = false },
	{ "williamboman/mason-lspconfig.nvim", enabled = false },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },

	-- 2. Replace LazyVim’s lsp/init.lua with our own minimal config
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- capabilities for completion
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- list of system-installed servers
			local servers = {
				lua_ls = {},
				gopls = {},
			}

			for name, opts in pairs(servers) do
				opts.capabilities = capabilities
				lspconfig[name].setup(opts)
			end
		end,
	},
}
