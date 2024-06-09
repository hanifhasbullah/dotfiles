lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "Equilibris/nx.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts  = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },

    -- Plugin will load when you use these keys
    -- keys = {
    --   { "<leader>na", "<cmd>Telescope nx actions<CR>", desc = "nx actions"},
    --   { "<leader>ng", "<cmd>Telescope nx generators<CR>", desc = "nx generators"}
    -- },
  }
}
