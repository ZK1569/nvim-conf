-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return 
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- colorscheme
    use("bluz71/vim-nightfly-guicolors")

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")
    
    -- maximaizes and restores current window size 
    use("szw/vim-maximizer")

    -- surround words with what you want 
    use("tpope/vim-surround")

    -- TODO: mettre une decription
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with gc
    use("numToStr/Comment.nvim")

    -- icons 
    use("kyazdani42/nvim-web-devicons")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    
    -- statusline 
    use("nvim-lualine/lualine.nvim")

    -- file finder
    use({"nvim-telescope/telescope-fzf-native.nvim", run="make"})
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x" })

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- snippets
    use("L3MON4D3/LuaSnip") 
    use("saadparwaiz1/cmp_luasnip") 
    use("rafamadriz/friendly-snippets")


    if packer_bootstrap then
        require ("packer").sync()
    end
end)
