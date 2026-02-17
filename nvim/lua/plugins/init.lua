return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ transparent_background = true })
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local status, ts = pcall(require, "nvim-treesitter.configs")
      if not status then return end
      ts.setup({
        ensure_installed = { "python", "cpp", "lua", "javascript" },
        highlight = { enable = true },
      })
    end,
  },

  { "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons", config = true },
  { "nvim-lualine/lualine.nvim", config = true },
  { "akinsho/bufferline.nvim", config = true },
  { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", config = { ensure_installed = { "pyright", "clangd" } } },
  { "neovim/nvim-lspconfig" },
}
