local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	use("kdheepak/tabline.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("folke/zen-mode.nvim")
	use("luukvbaal/stabilize.nvim")
	use("phaazon/hop.nvim")
	use("MattesGroeger/vim-bookmarks")
	use("ur4ltz/surround.nvim")
	use("nacro90/numb.nvim")
	use("rcarriga/nvim-notify")
	use("br1anchen/nvim-colorizer.lua")
	use("CRAG666/code_runner.nvim")
	use("mg979/vim-visual-multi")
	use("tpope/vim-apathy")
	use("tpope/vim-repeat")
	use("mechatroner/rainbow_csv")
	use("MunifTanjim/nui.nvim")
	use("karb94/neoscroll.nvim")
	use("junegunn/vim-easy-align")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({
		"Shougo/defx.nvim",
		run = ":UpdateRemotePlugins",
		requires = {
			{ "kristijanhusak/defx-icons" },
			{ "kristijanhusak/defx-git" },
		},
	})
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- markdown
	use("godlygeek/tabular")
	use("SidOfc/mkdx")
	use("jxnblk/vim-mdx-js")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
	})

	-- Colorschemes
	--[[ use("folke/tokyonight.nvim") ]]
	use("AsheAnn/tokyonight.nvim")
	use("olimorris/onedarkpro.nvim")
	use("overcache/NeoSolarized")
	use("lifepillar/vim-solarized8")
	use("Shatur/neovim-ayu")
	use("projekt0n/github-nvim-theme")

	-- Typescript
	use("jose-elias-alvarez/typescript.nvim")

	-- ruby on rails
	use("vim-ruby/vim-ruby")
	use("tpope/vim-rails")
	use("tpope/vim-dispatch")
	use("tpope/vim-bundler")

	-- go
	use("fatih/vim-go")

	-- rust
	use("Saecki/crates.nvim")
  use("simrat39/rust-tools.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				method = "getCompletionsCycling",
				event = { "InsertEnter", "LspAttach" },
				fix_pairs = true,
				formatters = {
					label = require("copilot_cmp.format").format_label_text,
					insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				},
			})
		end,
	})
	use({
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
				run_on_every_keystroke = true,
				snippet_placeholder = "..",
				ignored_file_types = { -- default is not to ignore
					-- uncomment to ignore in lua:
					-- lua = true
				},
			})
		end,
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "b8fa22f" }) --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "14b5a30" }) -- for formatters and linters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use({ "glepnir/lspsaga.nvim", commit = "aab859641ec21decc0495c54be70d2171d62fd18" })
	use("MunifTanjim/prettier.nvim")
	use("b0o/schemastore.nvim")
	use("ray-x/lsp_signature.nvim")
	use("folke/neodev.nvim")
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				cmd = "TroubleToggle",
			})
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")

	-- AI
	use("jackMort/ChatGPT.nvim")
	use("zbirenbaum/copilot.lua")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")

	-- Database
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
