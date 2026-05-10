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
      vim.keymap.set({ "i", "c" }, "<C-_>", "<Plug>(skkeleton-toggle)", { remap = true })
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
    enabled = false,  -- LSPs/formatters は Nix (home.packages) で管理
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

      -- tex ファイルで \\ を打つとき補完メニューを閉じる
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          vim.keymap.set("i", "\\\\", function()
            local cmp_ok, cmp = pcall(require, "cmp")
            if cmp_ok and cmp.visible() then
              cmp.abort()
            end
            return "\\\\"
          end, { buffer = true, expr = true })
        end,
      })
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
