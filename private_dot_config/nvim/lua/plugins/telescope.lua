return {
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-lua/plenary.nvim", 
    },
    config = function()
      require('telescope').setup {
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
      require('telescope').load_extension('ui-select')

      local builtin = require'telescope.builtin'
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
      vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
      vim.keymap.set('n', '<space>D', builtin.lsp_type_definitions, opts)
      vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
    end,
  },
}
