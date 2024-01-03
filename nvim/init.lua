-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


-- vim.g.vimtex_view_automatic = 0
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_view_method = 'zathura'
vim.o.shell = "/usr/bin/zsh"
vim.g.autoformat = false

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- i3 syntax highlighting
autocmd({'BufNewFile','BufRead'}, {
  group = augroup('i3config_ft_detection', { clear = true } ),
  pattern = {'*/.config/i3*'},
  command = 'set filetype=i3config',
})
