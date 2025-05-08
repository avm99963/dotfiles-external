require("lazy").setup({
  spec = {
    import = "plugins",
  },
  dev = {
    path = "~/gitrepos/vim",
    fallback = true,
  },
})
