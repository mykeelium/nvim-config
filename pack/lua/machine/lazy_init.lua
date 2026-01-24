require("lazy").setup({
  spec = "machine.lazy",
  change_detection = { notify = false },
  root = "/usr/share/nvim/plugins",
  state = "/var/lib/nvim/lazy",
  lockfile = "/usr/share/nvim/lazy-lock.json",
})
