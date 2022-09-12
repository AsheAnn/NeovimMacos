local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "a7c826d" } -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "kdheepak/tabline.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "folke/which-key.nvim"
  use "folke/zen-mode.nvim"
  use "luukvbaal/stabilize.nvim"
  use "phaazon/hop.nvim"
  use "MattesGroeger/vim-bookmarks"
  use "ur4ltz/surround.nvim"
  use "nacro90/numb.nvim"
  use "rcarriga/nvim-notify"
  use "br1anchen/nvim-colorizer.lua"
  use "CRAG666/code_runner.nvim"
  use "mg979/vim-visual-multi"
  use "tpope/vim-apathy"
  use "tpope/vim-repeat"
  use "mechatroner/rainbow_csv"
  use "karb94/neoscroll.nvim"
  use { "Shougo/defx.nvim",
    run = ':UpdateRemotePlugins',
    requires = {
      { 'kristijanhusak/defx-icons' },
      { 'kristijanhusak/defx-git' }
    }
  }

  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }


  -- markdown
  use "godlygeek/tabular"
  -- use "gabrielelana/vim-markdown"
  use "SidOfc/mkdx"
  use "jxnblk/vim-mdx-js"
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- Colorschemes
  use "AsheAnn/tokyonight.nvim"
  use "olimorris/onedarkpro.nvim"
  use "overcache/NeoSolarized"
  use "lifepillar/vim-solarized8"
  use "Shatur/neovim-ayu"

  -- Typescript
  use "jose-elias-alvarez/typescript.nvim"

  -- ruby on rails
  use "vim-ruby/vim-ruby"
  use "tpope/vim-rails"
  use "tpope/vim-dispatch"
  use "tpope/vim-bundler"

  -- go
  use "fatih/vim-go"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        ignored_file_types = { -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        },
      }
    end,

    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "b8fa22f" } --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "glepnir/lspsaga.nvim"
  use "MunifTanjim/prettier.nvim"
  use "b0o/schemastore.nvim"
  use "ray-x/lsp_signature.nvim"
  use "folke/lua-dev.nvim"
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        cmd = "TroubleToggle",
      }
    end
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"

  -- take note
  use "mickael-menu/zk-nvim"

  -- Database
  use "tpope/vim-dadbod"
  use "kristijanhusak/vim-dadbod-ui"

  -- DAP
  -- use "mfussenegger/nvim-dap"
  -- use "theHamsta/nvim-dap-virtual-text"
  -- use "rcarriga/nvim-dap-ui"
  -- use "Pocco81/DAPInstall.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
