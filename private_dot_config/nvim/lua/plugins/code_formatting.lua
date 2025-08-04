return {
  "editorconfig/editorconfig-vim",
  {
    'stevearc/conform.nvim',
    keys = {
      {
        '<space>f',
        function ()
          require'conform'.format({ async = true })
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        typescript = {
          'prettierd',
          'prettier',
          stop_after_first = true
        },
        typescriptreact = {
          'prettierd',
          'prettier',
          stop_after_first = true
        },
        jjdescription = {
          'commitmsgfmt',
        },
        terraform = {
          lsp_format = "prefer",
        },
        kotlin = {
          lsp_format = "prefer",
        },
      },
      default_format_opts = {
        lsp_format = 'never',
      },
      format_on_save = {
        timeout_ms = 500,
      },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2', '-ci' }
        },
      },
    },
  },
  {
    "google/vim-codefmt",
    dependencies = {
      "google/vim-maktaba",
      "google/vim-glaive",
    },
    config = function()
      vim.cmd.Glaive({ "codefmt", "shfmt_options=`['-i', '2', '-ci']`" })
      vim.cmd.Glaive({ "codefmt", "prettier_executable=`['npx', 'prettier']`" })

      vim.api.nvim_create_augroup('autoformat_settings', { clear = true })
      vim.api.nvim_create_autocmd({'FileType'}, {
        pattern = 'javascript',
        group = 'autoformat_settings',
        command = 'let b:codefmt_formatter = \'clang-format\'',
      })
      vim.api.nvim_create_autocmd({'FileType'}, {
        pattern = 'html',
        group = 'autoformat_settings',
        command = 'let b:codefmt_formatter = \'prettier\'',
      })
    end,
  },
}
