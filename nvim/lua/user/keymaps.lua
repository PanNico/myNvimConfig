function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

--[[
Map("i", "<C-s>", "<Cmd>:w<CR>")
Map("i", "<C-o>", "<Cmd>:vsplit<CR>")
Map("i", "<C-p>", "<Cmd>:split<CR>")
Map("i", "<C-q>", "<Cmd>:q<CR>")
Map("i", "<S-q>", "<Cmd>:qa<CR>")
Map("i", "<C-t>", "<Cmd>:tabnew<CR>")
Map("i", "<C-a>", "<Cmd>:NvimTreeOpen<CR>")
--]]

Map("v", "<C-s>", "<Cmd>:w<CR>")
Map("v", "<C-o>", "<Cmd>:vsplit<CR>")
Map("v", "<C-p>", "<Cmd>:split<CR>")
Map("v", "<C-q>", "<Cmd>:q<CR>")
Map("v", "<S-q>", "<Cmd>:qa<CR>")
Map("v", "<C-t>", "<Cmd>:tabnew<CR>")
Map("v", "<C-a>", "<Cmd>:NvimTreeOpen<CR>")
Map("v", "gg", "<Cmd>:LazyGit<CR>")

-- Save with ctrl + s
Map("n", "<C-s>", ":w<CR>")
Map("n", "<C-o>", ":vsplit<CR>")
Map("n", "<C-p>", ":split<CR>")
Map("n", "<C-q>", ":q<CR>")
Map("n", "<S-q>", ":qa<CR>")
Map("n", "<C-t>", ":tabnew<CR>")

Map("n", "<C-up>", "<C-w><up>")
Map("n", "<C-down>", "<C-w><down>")
Map("n", "<C-left>", "<C-w><left>")
Map("n", "<C-right>", "<C-w><right>")
Map("n", "<C-a>", ":NvimTreeOpen<CR>")
Map("n", "<S-Left>", ":tabprevious<CR>")
Map("n", "<S-Right>", ":tabnext<CR>")
Map("n", "gg", ":LazyGit<CR>")

Map("n", "1", "<Home>")
Map("n", "2", "<End>")
Map("n", "3", "<C-Home>")
Map("n", "4", "<C-End>")

-- Telescope maps
local builtin = require('telescope.builtin')
Map('n', 'ff', builtin.find_files)
Map('n', 'fg', builtin.live_grep)
Map('n', 'fb', builtin.buffers)
Map('n', 'fh', builtin.help_tags)

vim.api.nvim_command('inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"')
