return {
  "google/vim-maktaba",
  {
    "google/vim-glaive",
    dependencies = {
      "google/vim-maktaba",
    },
    config = function()
      vim.cmd('call glaive#Install()')
    end,
  },
}
