local opt = vim.opt

opt.shada = "'100,<50,s10,h"
opt.termguicolors = true

-- Remember cursor position
-- vim.api.nvim_create_autocmd('BufReadPost', {
--   callback = function()
--     local line = vim.fn.line '\'"'
--     if line > 1 and line <= vim.fn.line '$' then
--       vim.cmd 'normal! g`"'
--     end
--   end,
-- })

opt.number = true
opt.relativenumber = false
opt.mouse = 'a'
opt.showmode = false
opt.clipboard = 'unnamedplus'
opt.breakindent = true
-- opt.undofile = true
opt.undofile = false
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split'
opt.cursorline = true
opt.scrolloff = 2
opt.hlsearch = true



return {
  setup = function() end,
}
