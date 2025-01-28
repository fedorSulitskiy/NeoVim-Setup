
-- Code Actions
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gpi", ":Gitsigns preview_hunk_inline<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Telescope
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.keymap.set("n", "<C-A-f>", builtin.live_grep, {})
-- vim.keymap.set("n", "<C-A-b>", builtin.buffers, {})

-- Formating
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

-- NeoTree
vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", {})
