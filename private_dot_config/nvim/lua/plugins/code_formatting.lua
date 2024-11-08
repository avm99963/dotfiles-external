return {
  "editorconfig/editorconfig-vim",
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
