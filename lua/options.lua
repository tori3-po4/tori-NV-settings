require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.timeout = true
vim.opt.timeoutlen = 250
vim.opt.exrc = true
vim.opt.wrap = false
-- ヤンク時のみシステムクリップボードへ同期する（autocmds.luaで設定）
-- ペースト時のクリップボード読み取り許可ダイアログを回避するため
-- unnamedplusは使わない
-- システムクリップボードからペーストしたい場合は "+p を使用
vim.o.winborder = "rounded"
