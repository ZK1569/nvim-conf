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

    -- config lsp servers
    use("hrsh7th/cmp-nvim-lsp")
    use({"glepnir/lspsaga.nvim", branch = "main"})
    use("jose-elias-alvarez/typescript.nvim")

    use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
              -- LSP Support
              {'neovim/nvim-lspconfig'},
              {'williamboman/mason.nvim'},
              {'williamboman/mason-lspconfig.nvim'},

              -- Autocompletion
              {'hrsh7th/nvim-cmp'},
              {'hrsh7th/cmp-buffer'},
              {'hrsh7th/cmp-path'},
              {'saadparwaiz1/cmp_luasnip'},
              {'hrsh7th/cmp-nvim-lsp'},
              {'hrsh7th/cmp-nvim-lua'},

              -- Snippets
              {'L3MON4D3/LuaSnip'},
              {'rafamadriz/friendly-snippets'},
          }
      }   use("onsails/lspkind.nvim")

    -- treesitter 
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({with_sync = true })
        end,
    })

    -- auto closing
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- git 
    use("lewis6991/gitsigns.nvim")

    -- Bufferline
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")

    if packer_bootstrap then
        require ("packer").sync()
    end
end)
