vim.g.mapleader = " " -- Set leader key before Lazy

-- Set python3 host if available (prefer pyenv, fallback to system)
local python_paths = {
  vim.fn.expand("$HOME/.pyenv/shims/python3"),
  "/usr/bin/python3",
}
for _, path in ipairs(python_paths) do
  if vim.fn.executable(path) == 1 then
    vim.g.python3_host_prog = path
    break
  end
end

require("machine.lazy_init")
require("machine.file_explorer")
require("machine.remap")
require("machine.set")
require("machine.autocmds")
require("core.diagnostics")
require('mini.icons').setup()
