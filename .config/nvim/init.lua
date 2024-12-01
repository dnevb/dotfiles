require('options')
require('lazyvim')
require('mappings')

vim.cmd.colorscheme(vim.g.colorscheme)

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

