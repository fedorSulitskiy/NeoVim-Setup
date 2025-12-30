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

			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local nixdSetup = {
				nixpkgs = {
					expr = "import <nixpkgs> { }",
				},
				formatting = {
					command = { "nixfmt" }, -- or nixfmt or nixpkgs-fmt
				},
			}

			local goplsSetup = {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotml" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
					},
				},
			}

			local servers = { lua_ls = {}, gopls = goplsSetup, nixd = nixdSetup }

			for name, server_opts in pairs(servers) do
				server_opts.capabilities = capabilities
				lspconfig[name].setup(server_opts)
			end
		end,
	},

	-- 3. null-ls for go
	{
		"nvimtools/none-ls.nvim",
		ft = "go",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports_reviser,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
}
