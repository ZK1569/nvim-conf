require ("nvim-tree").setup({
    view = {
        width = 35,
    },
    filters = {
        dotfiles = true,
    },
    renderer = {
        group_empty = true,
    },
})

vim.keymap.set("n", "<leader>e", function()
    require("nvim-tree.api").tree.toggle({
        path = "<args>",
        find_file = true,
        update_root = "<bang>",
        focus = true,
    })
end, { desc = "Toggle NvimTree" })

