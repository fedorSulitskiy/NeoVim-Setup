return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP symbols only
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")

			---@param entry cmp.Entry
			---@return boolean  false → hide the item
			local function skip_text(entry)
				local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
				return kind ~= "Text" and kind ~= "Snippet" -- tweak as needed
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp", entry_filter = skip_text },
					{ name = "luasnip" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
				}),
			})
		end,
	},
}
