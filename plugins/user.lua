return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  "p00f/clangd_extensions.nvim", -- install lsp plugin
  "simrat39/rust-tools.nvim",    -- add lsp plugin
  "xiyaowong/transparent.nvim",  -- add transparent commands
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
