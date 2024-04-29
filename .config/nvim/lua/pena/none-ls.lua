local nl_status_ok, null_ls = pcall(require, 'null-ls')
if not nl_status_ok then
  vim.notify('null-ls ok')
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    diagnostics.eslint,
    formatting.prettier,
  },
}
