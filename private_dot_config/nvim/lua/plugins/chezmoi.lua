return {
  {
    'xvzc/chezmoi.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("chezmoi").setup{}

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
        callback = function()
          vim.schedule(require("chezmoi.commands.__edit").watch)
        end,
      })
    end
  },
  {
    'alker0/chezmoi.vim',
    lazy = false,
    init = function()
      vim.g['chezmoi#use_tmp_buffer'] = true
    end,
  },
}
