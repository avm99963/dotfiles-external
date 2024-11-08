vim.api.nvim_create_user_command('CopyRelativePath', 'let @+ = expand("%:~:.")', {})

vim.api.nvim_create_user_command('VirtualTextOn', function()
  vim.diagnostic.config({virtual_text=true})
end, {})
vim.api.nvim_create_user_command('VirtualTextOff', function()
  vim.diagnostic.config({virtual_text=false})
end, {})
