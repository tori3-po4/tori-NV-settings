require "nvchad.autocmds"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Sync yank to system clipboard without unnamedplus",
  callback = function()
    if vim.v.event.operator == "y" then
      vim.fn.setreg("+", vim.v.event.regcontents)
    end
  end,
})
