local setup, blankline = pcall(require, "indent_blankline")
if not setup then
    print("ERROR blankline")
    return
end

blankline.setup()
