return {
	-- 1. Disable the Mason-related plugins
	{ "williamboman/mason.nvim", enabled = false },
	{ "williamboman/mason-lspconfig.nvim", enabled = false },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },

	-- 2. Minimal lspconfig setup
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		opts = {
			diagnostics = {
				virtual_text = true,
				signs = true,
				underline = true,
			},
		},
		config = function(_, opts)
			-- apply diagnostic look-and-feel
			vim.diagnostic.config(opts.diagnostics)
		end,
	},
}
