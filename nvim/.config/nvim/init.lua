-- Satır numaralarını göster
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab genişliği
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Renk desteği ve arama
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Basit bir tema denemesi
vim.cmd('colorscheme desert')

-- 1. Eklenti Yöneticisi (Lazy.nvim) Kurulumu
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Temel Ayarlar
vim.g.mapleader = " " -- Boşluk tuşunu (Space) ana komut tuşu yap
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true

-- 3. Eklentiler
require("lazy").setup({
  -- Renk Teması (Siyah/Koyu)
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  -- Dosya Gezgini (Nvim-Tree)
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  
  -- Telescope (Dosya Arama)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  
  -- LSP ve Kod Tamamlama (IoT ve Web için)
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },           -- LSP Yöneticisi
  { "williamboman/mason-lspconfig.nvim" }, -- Köprü
  { "hrsh7th/nvim-cmp" },                  -- Tamamlama Motoru
  { "hrsh7th/cmp-nvim-lsp" },              -- LSP Kaynağı
})

-- 4. Eklenti Ayarları
-- vim.cmd("colorscheme catppuccin-mocha")
require("catppuccin").setup({
    transparent_background = true,
})
vim.cmd("colorscheme catppuccin")
require("nvim-tree").setup()           -- Dosya gezginini aktif et

-- 5. Kısayollar (Keybindings)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Space + f + f -> Dosya Ara
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {}) -- Space + e -> Gezgini Aç/Kapat

-- Mason (LSP Yükleyici) Başlat
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd", "ts_ls" } -- Python, C++, JS/TS
})
