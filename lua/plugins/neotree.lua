return {
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
            })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                filters = {
                    show_hidden = true,    -- show dotfiles
                    show_ignored = true,   -- show stuff in .gitignore
                    hide_dotfiles = false, -- keep them visible when toggling
                },
            },
        },
    },
}
