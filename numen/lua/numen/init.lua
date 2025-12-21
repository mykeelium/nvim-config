vim.g.mapleader = " " -- Set leader key before Lazy
vim.g.python3_host_prog = vim.fn.expand("/home/mcuomo/.pyenv/versions/3.14.2/bin/python")

require("numen.lazy_init")
require("numen.file_explorer")
require("numen.remap")
require("numen.set")
require("numen.autocmds")
require("config.diagnostics")
require('mini.icons').setup()
