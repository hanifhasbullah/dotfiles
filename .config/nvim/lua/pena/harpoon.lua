local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>hm", function()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end, { noremap = true, silent = true, desc = 'mark file into harpoon' })
keymap("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
