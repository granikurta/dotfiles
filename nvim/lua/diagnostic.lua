-- Toggle virtual_lines 
vim.keymap.set('n', '<F3>', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
  vim.diagnostic.config({ virtual_text = not new_config})
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.diagnostic.config({ virtual_lines = true})
