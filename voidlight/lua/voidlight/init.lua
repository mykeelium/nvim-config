vim.g.mapleader = " " -- Set leader key before Lazy
vim.g.python3_host_prog = vim.fn.expand("/home/mcuomo/.pyenv/versions/3.14.2/bin/python")

require("voidlight.lazy_init")
require("voidlight.file_explorer")
require("voidlight.remap")
require("voidlight.set")
require("voidlight.autocmds")
require("config.diagnostics")
require('mini.icons').setup()
