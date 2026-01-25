-- Bootstrap lazy.nvim for system-wide installation
local lazypath = "/usr/share/nvim/lazy"
if vim.uv.fs_stat(lazypath) then
  vim.opt.rtp:prepend(lazypath)
end

require("machine")
