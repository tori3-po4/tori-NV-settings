return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
  },
  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
    },
    lazy = false,
    config = function()
      vim.keymap.set({ "i", "c" }, "<C-/>", "<Plug>(skkeleton-toggle)")
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-initialize-pre",
        callback = function()
          vim.fn["skkeleton#config"]({
            globalDictionaries = { vim.fn.expand("~/.skk/SKK-JISYO.L") },
          })
        end,
      })
    end,
  },
 {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "texlab",
        "tex-fmt",
      },
    },
  },

  -- vimtex（コンパイル・SyncTeX・構文ハイライト）
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = "skim"

      -- エンジン定義（マジックコメントで自動選択）
      vim.g.vimtex_compiler_latexmk_engines = {
        _        = "-lualatex",   -- デフォルト
        lualatex = "-lualatex",
        pdflatex = "-pdf",
        platex   = "-platex",
        uplatex  = "-uplatex",
        xelatex  = "-xelatex",
      }

      vim.g.vimtex_compiler_latexmk = {
        aux_dir    = ".aux",
        out_dir    = ".out",
        callback   = 1,
        continuous = 1,
        executable = "latexmk",
        options    = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_quickfix_mode  = 2
    end,
  },


  {
    "Julian/lean.nvim",
    event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
    dependencies = {
      'andymass/vim-matchup',
      'andrewradev/switch.vim',
      'tomtom/tcomment_vim',

    },

    ---@type lean.config
    opts = {
      mapping = true,
    }
  }

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
