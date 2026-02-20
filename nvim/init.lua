-----------------------------------------------------------
-- lazy.nvim bootstrap
-----------------------------------------------------------
-- lazy.nvimの保存場所を設定
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- lazy.nvimが無ければ取得(必要最小限)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
-- runtimepathにlazy.nvimを追加
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require("lazy").setup("plugins")

-----------------------------------------------------------
-- Settings
-----------------------------------------------------------
-- Leader key
vim.g.mapleader = " "
-- オプション設定
require("config.options")
-- キーマップ設定
require("config.keymaps")
