return {
  --TODO: maybe use hlchunk instead of indent-blankline later

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- move navic to winbar
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.remove(opts.sections.lualine_c, 4)
    end,
  },
  {
    "utilyre/barbecue.nvim",
    lazy = "VeryLazy",
    event = "BufReadPre",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup()
      require("barbecue.ui").toggle(true)
    end,
  },

  -- jk, jj as Esc in NORMAL mode
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- Configure gruvbox as colorscheme of LazyVim
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- Ensure install needed debuggers
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
      },
    },
  },

  --TODO: docs
  {
    "rmagatti/goto-preview",
    keys = { "gp" },
    config = function()
      require("goto-preview").setup({
        width = 120,
        height = 25,
        default_mappings = true,
        debug = false,
        opacity = nil,
        post_open_hook = nil,
      })
    end,
  },

  -- CRUD for pairs
  {
    "echasnovski/mini.surround",
    version = false,
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  --TODO: docs
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre" },
    cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
    config = function()
      require("treesitter-context").setup({
        enable = true,
        throttle = true,
        max_lines = 0,
        patterns = {
          default = {
            "class",
            "function",
            "method",
          },
        },
      })
    end,
  },

  -- restful test tool
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal/vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generrated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_varibles = {},
        yank_dry_run = true,
      })
    end,
  },
}
