local status_ok, _ = pcall(require, "git-worktree")
if not status_ok then
  vim.notify('worktree not ok');
  return
end

require("git-worktree").setup()
require('telescope').load_extension('git_worktree')

vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", {desc = '[G]it Worktree'})
vim.keymap.set("n", "<leader>ga", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {desc = '[G]it Worktree - add new worktree'})
-- vim.keymap.set('n', '<leader>gf', telescope_builtin.git_files, { desc = 'Search [G]it [F]iles' })
