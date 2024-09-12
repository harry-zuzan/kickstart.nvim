-- need to figure out why it fails without tokyonight
-- need to figure out the priority 1000 reason

return  {
     'folke/tokyonight.nvim',
     priority = 1000, -- Make sure to load this before all the other start plugins.
     init = function()
       vim.cmd.colorscheme 'desert'
     end,
  }
