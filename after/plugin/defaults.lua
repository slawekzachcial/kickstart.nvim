vim.opt.relativenumber = true
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.list = true
vim.opt.listchars = 'tab:→ ,trail:·,precedes:«,extends:»'
vim.opt.spelllang = 'en_us'

-- Cycle between buffers
vim.keymap.set('n', '<C-b>', ':edit #<cr>', { desc = 'Switch to previous buffer' })

-- Toggle things
vim.keymap.set('n', '<leader>th', ':set hlsearch!<cr>', { desc = '[T]oggle search [h]ighlight' })
vim.keymap.set('n', '<leader>ts', ':set spell!<cr>', { desc = '[T]oggle [s]pelling' })
vim.keymap.set('n', '<leader>tw', ':set wrap!<cr>', { desc = '[T]oggle [w]rap' })
vim.keymap.set('n', '<leader>tr', ':set relativenumber!<cr>', { desc = '[T]oggle [r]relativenumber' })

-- Terraform - format on save
require'lspconfig'.terraformls.setup{
  root_dir = require('lspconfig.util').root_pattern('.git', '.terraform')
}

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = {'*.tf', '*.tfvars', '*.go'},
  callback = function() vim.lsp.buf.format() end,
})

vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })

-- require'telescope'.load_extension'repo'
