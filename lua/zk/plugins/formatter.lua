local setup, formatter = pcall(require, "formatter")
if not setup then
    print("ERROR formatter")
    return 
end

local util_setup, util = pcall(require, "formatter.util")
if not util_setup then 
    print("ERROR formatter utils")
    return 
end

formatter.setup({
    filetype = {
        typescript = {
            require("formatter.filetypes.typescript").prettier
        },
    }
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    command = "FormatWriteLock"
})
