require("user.plugins")
require("user.options")
require("user.keymaps")
require("user.colorscheme")
--require("user.test")

local async = require("plenary.async")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.showmode = false

require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    change_dir = {
      global = true
    }
  }
})


require("user.bottomline")
require("telescope")
require("bufferline").setup{}
require'lspconfig'.lua_ls.setup{}
require('gitsigns').setup()
require("scrollbar").setup()


