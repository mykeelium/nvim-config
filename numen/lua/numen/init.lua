vim.g.mapleader = " " -- Set leader key before Lazy

require("numen.lazy_init")
require("numen.file_explorer")
require("numen.remap")
require("numen.set")
require("numen.autocmds")
require("config.diagnostics")
require('mini.icons').setup()
