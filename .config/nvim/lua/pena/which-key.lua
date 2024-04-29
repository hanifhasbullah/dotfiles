local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify('which_key not ok');
  return
end

local mappings = {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>W'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  ['<leader>q'] = { name = '[Q]uit', _ = 'which_key_ignore' },
}

which_key.register(mappings)
