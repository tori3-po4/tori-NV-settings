require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "texlab", "ocamllsp" }
vim.lsp.enable(servers)

vim.lsp.config("ocamllsp", {
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p:h"))
  end,
})

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
