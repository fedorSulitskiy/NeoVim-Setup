-- WE ACTUALLY USE NONE-LS
-- https://github.com/nvimtools/none-ls.nvim
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- GO
				null_ls.builtins.formatting.gofmt,

				-- Python
				null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
				null_ls.builtins.formatting.isort,

				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Spelling (?)
				null_ls.builtins.completion.spell,
			},
		})

		vim.keymap.set("n", "<S-A-f>", vim.lsp.buf.format, {})
	end,
}
