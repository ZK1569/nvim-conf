local setup, colorizer = pcall(require, "colorizer")
if not setup then
    print("ERROR colorizer")
    return
end

colorizer.setup()
