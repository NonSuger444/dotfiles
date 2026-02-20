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
require("lazy").setup({
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({
        keys = "hklyuiopnm,qwertzxcvbasdgjf;",
        jump_on_sole_occurrence = true,
      })
    end
  },
})

-----------------------------------------------------------
-- Basic Settings
-----------------------------------------------------------
-- hop 読み込み
local hop = require("hop")
-- オプション設定
local opts = { noremap = true, silent = true }
-- Leader key
vim.g.mapleader = " "

-----------------------------------------------------------
-- Options
-----------------------------------------------------------
-- 横移動で行またぎを可能にする
vim.opt.whichwrap = "h,l,<,>,[,],b,s"
-- システムクリップボードと共有する
vim.opt.clipboard = "unnamedplus"
-- 検索結果をハイライト表示する
vim.opt.hlsearch = true
-- 入力中にリアルタイム検索
vim.opt.incsearch = true
-- 大文字小文字を無視
vim.opt.ignorecase = true
-- 大文字が含まれると区別する
vim.opt.smartcase = true

-----------------------------------------------------------
-- KeyBindings NormalMode
-----------------------------------------------------------
-- 保存
vim.keymap.set("n", "<leader>w", function()
  vim.fn.VSCodeNotify("workbench.action.files.save")
end, opts)

-- エディタを閉じる
vim.keymap.set("n", "<leader>q", function()
  vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
end, opts)

-- 行頭に移動
vim.keymap.set("n", "<leader>h", "^", opts)

-- 行末に移動
vim.keymap.set("n", "<leader>l", "$", opts)

-- 行を切り取り
vim.keymap.set("n", "<leader>d", function()
  vim.fn.VSCodeNotify("editor.action.clipboardCutAction")
end, opts)

-- 行削除（ブラックホール）
vim.keymap.set("n", "dd", "\"_dd", opts)

-- 文字削除（ブラックホール）
vim.keymap.set("n", "x", "\"_x", opts)

-- 2文字ジャンプ
vim.keymap.set("n", "<leader>f", function()
  hop.hint_char2()
end, opts)

-- エディタを左右に分割
vim.keymap.set("n", "<leader><leader>s", function()
  vim.fn.VSCodeNotify("workbench.action.splitEditor")
end, opts)

-- エディタを上下に分割
vim.keymap.set("n", "<leader><leader>v", function()
  vim.fn.VSCodeNotify("workbench.action.splitEditorDown")
end, opts)

-- 左の分割へ移動
vim.keymap.set("n", "<C-h>", function()
  vim.fn.VSCodeNotify("workbench.action.focusLeftGroup")
end, opts)

-- 右の分割へ移動
vim.keymap.set("n", "<C-l>", function()
  vim.fn.VSCodeNotify("workbench.action.focusRightGroup")
end, opts)

-- 上の分割へ移動
vim.keymap.set("n", "<C-k>", function()
  vim.fn.VSCodeNotify("workbench.action.focusAboveGroup")
end, opts)

-- 下の分割へ移動
vim.keymap.set("n", "<C-j>", function()
  vim.fn.VSCodeNotify("workbench.action.focusBelowGroup")
end, opts)

-- 分割サイズ均等化
vim.keymap.set("n", "<leader>=", function()
  vim.fn.VSCodeNotify("workbench.action.evenEditorWidths")
end, opts)

-- 下移動を「表示行単位」に変更
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "<Down>", "gj", opts)

-- 上移動を「表示行単位」に変更
vim.keymap.set("n", "k", "gk", opts)
vim.keymap.set("n", "<Up>", "gk", opts)

-- 検索ハイライトを消す
vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohlsearch")
end, opts)

-- init.lua を開く
vim.keymap.set("n", "<leader><leader>vi", function()
  require("vscode").action("workbench.action.quickOpen", {
    args = { vim.fn.stdpath("config") .. "/init.lua" }
  })
end, opts)

-----------------------------------------------------------
-- KeyBindings InsertMode
-----------------------------------------------------------
-- NormalModeへ戻る
vim.keymap.set("i", "jj", "<Esc>", opts)

-----------------------------------------------------------
-- KeyBindings VisualMode
-----------------------------------------------------------
-- 切り取り
vim.keymap.set("v", "<leader>d", "x", opts)

-- 行頭に移動
vim.keymap.set("v", "<leader>h", "^", opts)

-- 行末に移動
vim.keymap.set("v", "<leader>l", "$", opts)

-- 上書き貼り付け
vim.keymap.set("v", "p", "\"_dP", opts)
vim.keymap.set("v", "P", "\"_dP", opts)

-- 右インデント後も選択維持
vim.keymap.set("v", ">", ">gv", opts)

-- 左インデント後も選択維持
vim.keymap.set("v", "<", "<gv", opts)

-- 削除（ブラックホール）
vim.keymap.set("v", "d", "\"_d", opts)
vim.keymap.set("v", "x", "\"_x", opts)
