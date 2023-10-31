local setup, blankline = pcall(require, "ibl")
if not setup then
    print("ERROR blankline")
    return
end

blankline.setup()
