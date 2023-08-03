local setup, bufferline = pcall(require, "bufferline")
if not setup then
    print("ERROR bufferline")
    return
end

bufferline.setup({
    options = {
        diagnostics = "nvim_lsp",
    }
})
