return require('packer').startup(function(use)
      -- Packer can manage itself  
      use 'wbthomason/packer.nvim'
      use 'nvim-lua/plenary.nvim'
      use 'neovim/nvim-lspconfig'
      -- :checkhealth to figure out what is missing.
      --require("nvim-treesitter.health").check()

      use 'nvim-treesitter/nvim-treesitter'
      use 'hrsh7th/nvim-cmp'
      use 'jose-elias-alvarez/null-ls.nvim'
      -- telescope alternative: https://github.com/camspiers/snap
      use 'nvim-telescope/telescope.nvim'
      use 'nvim-tree/nvim-tree.lua'
      use 'akinsho/bufferline.nvim'
      use 'moll/vim-bbye'
      use 'folke/tokyonight.nvim'
      use 'feline-nvim/feline.nvim'
      use 'nvim-tree/nvim-web-devicons'
      use {'neoclide/coc.nvim', branch = 'release'}
      use 'lewis6991/gitsigns.nvim'
      use 'tpope/vim-fugitive'
      use({
        -- requires https://github.com/jesseduffield/lazygit
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        }
     })
     use("petertriho/nvim-scrollbar")
     -- https://github.com/dstein64/nvim-scrollview
     use({
       "rbong/vim-flog",
        requires = {
          "tpope/vim-fugitive"
        }
     })
    end)
