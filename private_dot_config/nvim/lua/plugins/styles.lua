return {
  {
    "vim-airline/vim-airline",
    dependencies = {
      "vim-airline/vim-airline-themes",
    },
    config = function()
      vim.g.airline_theme = 'tender'
    end,
  },
  "rafi/awesome-vim-colorschemes",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true

      require("nvim-tree").setup({
        view = {
          adaptive_size = true,
          width = {
            max = 50
          },
        },
        renderer = {
          group_empty = true,
          indent_markers = {
            enable = false,
            inline_arrows = false,
          },
        },
        git = {
          enable = true,
          timeout = 5000,
        },
        filters = {
          custom = {
            "^\\.git$",
            "^\\.jj",
            "^node_modules",
          },
          git_ignored = true,
          exclude = {
            ".env",
            ".local.yml",
          },
        },
        diagnostics = {
          enable = true,
        },
        modified = {
          enable = true,
        },
        update_focused_file = {
          enable = true,
        },
        select_prompts = true,
      })
    end,
  }
}
