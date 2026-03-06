vim.g.mapleader = " " -- Set leader key before Lazy
vim.g.python3_host_prog = vim.fn.expand("/home/mcuomo/.pyenv/versions/3.14.2/bin/python")

require("machine.lazy_init")
require("machine.file_explorer")
require("machine.remap")
require("machine.set")
require("machine.autocmds")
require("core.diagnostics")
require('mini.icons').setup()
