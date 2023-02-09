-- Auto install packer if not installed
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
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim and installs/updates/removes plugins
-- When file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Add list of plugins to install
return packer.startup(function(use)

  -- Packer
  use("wbthomason/packer.nvim")
  -- Lua functions needed for many plugins
  use("nvim-lua/plenary.nvim")
  -- Color scheme
  use("EdenEast/nightfox.nvim")
  -- Tmux & split window navigation
  use("christoomey/vim-tmux-navigator")
  -- Maximize and restore current window
  use("szw/vim-maximizer")
  -- Surround words
  use("tpope/vim-surround")
  -- Replace text with buffer content
  use("vim-scripts/ReplaceWithRegister")
  -- Commenting
  use("numToStr/Comment.nvim")
  -- File explorer
  use("nvim-tree/nvim-tree.lua")
  -- Icons
  use("kyazdani42/nvim-web-devicons")
  -- Status line
  -- use("nvim-lualine/lualine.nvim")
  use("feline-nvim/feline.nvim")
  -- Tabline 
  use("nanozuki/tabby.nvim")
  -- Fuzzy finding
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x" })

  ----------------------
  -- Autocomplition
  ----------------------
  -- Autocomplition plugin
  use("hrsh7th/nvim-cmp")
  -- Text in buffer
  use("hrsh7th/cmp-buffer")
  -- File system path
  use("hrsh7th/cmp-path")

  ----------------------
  -- Snippets
  ---------------------- 
  -- Snippets engine
  use("L3MON4D3/LuaSnip")
  -- Autocomplition snippet
  use("saadparwaiz1/cmp_luasnip")
  -- Useful Snippets
  use("rafamadriz/friendly-snippets")

  ----------------------
  -- Treesitter 
  ----------------------
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })


  ----------------------
  -- Autoclosing
  ----------------------
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  ----------------------
  -- LSP servers
  ----------------------
  -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason.nvim")
  -- bridges gap b/w mason & lspconfig
  use("williamboman/mason-lspconfig.nvim")
  -- easily configure language servers
  use("neovim/nvim-lspconfig")
  -- for autocompletion
  use("hrsh7th/cmp-nvim-lsp")
  -- enhanced lsp uis
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  -- additional functionality for typescript server (e.g. rename file & update imports)
  use("jose-elias-alvarez/typescript.nvim")
  -- vs-code like icons for autocompletion
  use("onsails/lspkind.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)

