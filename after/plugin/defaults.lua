vim.opt.relativenumber = true
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.list = true
vim.opt.listchars = 'tab:→ ,trail:·,precedes:«,extends:»'
vim.opt.spelllang = 'en_us'

-- Cycle between buffers
vim.keymap.set('n', '<C-b>', ':edit #<cr>')

-- Terraform - format on save
require'lspconfig'.terraformls.setup{}
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = {'*.tf', '*.tfvars'},
  callback = function() vim.lsp.buf.format() end,
})
