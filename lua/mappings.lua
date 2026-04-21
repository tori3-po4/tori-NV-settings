require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>te", function()
  local engines = {
    "lualatex",
    "pdflatex",
    "platex",
    "uplatex",
    "xelatex",
  }

  vim.ui.select(engines, {
    prompt = "Select LaTeX engine:",
  }, function(choice)
    if choice then
      -- バッファローカルにエンジンを上書き
      vim.b.vimtex_compiler_latexmk_engines = { _ = "-" .. choice }
      print("Engine switched to: " .. choice)
    end
  end)
end, { desc = "Switch LaTeX engine" })

map("n", "<leader>or", function()
  vim.cmd("vsplit | terminal utop")
end, { desc = "Open OCaml REPL (utop)" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
