local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    tex = {"latexindent"},
    ocaml = { "ocamlformat" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  formatters = {
    latexindent = {
      prepend_args = {"-m", "-l"},
    }
  }

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
