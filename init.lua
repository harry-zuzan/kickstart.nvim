-- import modules without crashing on an error
local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify('Failed to load ' .. module .. ' module', vim.log.levels.ERROR)
    return nil
  end
  return result
end

-- vim.opt setting
local options = safe_require 'user.options'
if options then
  options.setup()
end

-- custom key mappings
local keymaps = safe_require 'user.keymaps'
if keymaps then
  keymaps.setup()
end

-- Remember cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local line = vim.fn.line '\'"'
    if line > 1 and line <= vim.fn.line '$' then
      vim.cmd 'normal! g`"'
    end
  end,
})

--
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -- [[ Install `lazy.nvim` plugin manager ]]
-- --    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- if not vim.loop.fs_stat(lazypath) then
--   local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
--   vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
-- end ---@diagnostic disable-next-line: undefined-field
-- vim.opt.rtp:prepend(lazypath)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update

-- local plugins = safe_require 'user.plugins'
-- safe_require 'user.plugins'
-- - require("lazy").setup("plugins")

-- below here the code was dumpted into lua/user/plugins

-- require('flutter-tools').setup {} -- use defaults
