return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require 'nvim-treesitter'.setup {
      ensure_installed = {
        "c", "c_sharp", "lua", "go", "gosum", "gomod", "vim", "vimdoc", "elixir", "javascript", "html", "python", "typescript"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
