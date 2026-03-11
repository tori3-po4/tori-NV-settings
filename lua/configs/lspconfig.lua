require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","texlab" }
vim.lsp.enable(servers)

vim.lsp.config("texlab", {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = {
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%f",
        },
        onSave = true,
      },
      forwardSearch = {
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args = { "%l", "%p", "%f" },
      },
      chktex = { onOpenAndSave = true },
    },
  },
})

-- read :h vim.lsp.config for changing options of lsp servers 
