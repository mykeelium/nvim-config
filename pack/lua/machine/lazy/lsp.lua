-- Adapted from a combo of
-- https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        "lua_ls",
        "omnisharp",
        "gopls",
        "basedpyright",
        "ruff",
      },
      handlers = {
        function(server_name)
          vim.lsp.config(server_name, {
            capabilities = capabilities
          })
        end,
        lua_ls = function()
          vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT'
                },
                diagnostics = {
                  globals = { 'vim', 'love' },
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  }
                }
              }
            }
          })
        end,

        omnisharp = function()
          vim.lsp.config('omnisharp', {
            capabilities = capabilities,
            enable_roslyn_analysers = true,
            enable_import_completion = true,
            organize_imports_on_format = true,
            enable_decompilation_support = true,
            filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets', 'tproj', 'slngen', 'fproj' },
          })
        end,

        gopls = function()
          vim.lsp.config('gopls', {
            capabilities = capabilities,
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                  shadow = true,
                },
                staticcheck = true,
                gofumpt = true, -- use gofumpt formatting style
              },
            },
          })
        end,

        basedpyright = function()
          vim.lsp.config('basedpyright', {
            settings = {
              basedpyright = {
                analysis = {
                  autoSearchPath = true,
                  useLibraryCodeForTypes = true,
                }
              }
            }
          })
        end,

        ruff = function()
          vim.lsp.config('ruff', {})
        end,
      }
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- this is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<C-Space>'] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end
}
