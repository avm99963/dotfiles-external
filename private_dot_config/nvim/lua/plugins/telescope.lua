return {
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown{},
          },
        },
        defaults = {
          mappings = {
            i = { ["<c-t>"] = require('trouble.sources.telescope').open },
            n = { ["<c-t>"] = require('trouble.sources.telescope').open },
          },
          file_ignore_patterns = {
            "%.git/",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      }
      telescope.load_extension('ui-select')
      telescope.load_extension("live_grep_args")

      local builtin = require'telescope.builtin'
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
      vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
      vim.keymap.set('n', '<space>D', builtin.lsp_type_definitions, opts)
      vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
    end,
  },
}
