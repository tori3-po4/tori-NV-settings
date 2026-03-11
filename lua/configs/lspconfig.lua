require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","texlab" }
vim.lsp.enable(servers)

vim.lsp.config("texlab", {
  settings = {
    texlab = {
      build = {
        onSave = false,
      },
      chktex = { onOpenAndSave = false },
      diagnostics = {
        ignoredPatterns = { ".*" },  -- texlab 独自診断も抑制
      },
    },
  },
})

-- read :h vim.lsp.config for changing options of lsp servers 
