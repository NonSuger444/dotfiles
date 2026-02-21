local autocmd = vim.api.nvim_create_autocmd

-- Markdownファイルを開いたときの設定
autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Tabキーのインデント幅
    vim.opt_local.tabstop = 2
    -- インデント幅
    vim.opt_local.shiftwidth = 2
    -- InsertモードのTabキーのインデント幅
    vim.opt_local.softtabstop = 2
    -- スペースでインデント
    vim.opt_local.expandtab = true
  end,
})