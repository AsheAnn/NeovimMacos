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
  use {"numToStr/Comment.nvim", commit = "0aaea32"} -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use {"kyazdani42/nvim-tree.lua", commit = "cff5a10"}
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use {"kdheepak/tabline.nvim", commit = "57784ac"}
  use "akinsho/bufferline.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "folke/zen-mode.nvim"
  use "luukvbaal/stabilize.nvim"
  use "phaazon/hop.nvim"
  use "lunarvim/vim-solidity"
  -- use "wfxr/minimap.vim"
  use "ur4ltz/surround.nvim"
  use "nacro90/numb.nvim"
  use "rcarriga/nvim-notify"
  use "br1anchen/nvim-colorizer.lua"
  use { "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" }
  use "mg979/vim-visual-multi"
  use "tpope/vim-apathy"
  use "tpope/vim-repeat"
  use "junegunn/goyo.vim"
  use "folke/twilight.nvim"
  use "mechatroner/rainbow_csv"
  use "karb94/neoscroll.nvim"
  use {"Shougo/defx.nvim",
        run = ':UpdateRemotePlugins',
        requires = {
            {'kristijanhusak/defx-icons'},
            {'kristijanhusak/defx-git'}
        }
      }
  
  use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end
  }


  -- markdown
  use "godlygeek/tabular"
  use "gabrielelana/vim-markdown"
  use "jxnblk/vim-mdx-js"
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

 -- Colorschemes
  use "olimorris/onedarkpro.nvim"
  use "folke/tokyonight.nvim"
  use "overcache/NeoSolarized"
  use "Mofiqul/dracula.nvim"
  use {"Shatur/neovim-ayu", commit = "88bee21"}
  use "lifepillar/vim-solarized8"
  use "Mofiqul/adwaita.nvim"
  use "rose-pine/neovim"

  -- ruby on rails
  use "vim-ruby/vim-ruby"
  use "tpope/vim-rails"
  use "tpope/vim-dispatch"
  use "tpope/vim-bundler"

  -- go
  use "fatih/vim-go"

 -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
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
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use {"jose-elias-alvarez/null-ls.nvim", commit="0c7624f"} -- for formatters and linters 
  use "prettier/vim-prettier"
  use "b0o/schemastore.nvim"
  use "ray-x/lsp_signature.nvim"
  use "github/copilot.vim"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        cmd = "TroubleToggle",
        }
    end
  }



  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

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
  use "ldelossa/gh.nvim"
  use "ldelossa/litee.nvim"
  
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
