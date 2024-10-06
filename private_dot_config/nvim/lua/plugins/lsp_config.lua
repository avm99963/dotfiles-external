return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- @source: https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
      -- LSP global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

      local lspconfig = require('lspconfig')
      local configs = require('lspconfig.configs')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.pylsp.setup {
        capabilities = capabilities
      }
      lspconfig.eslint.setup {
        capabilities = capabilities
      }
      --require'typescript-tools'.setup {
      --  capabilities = capabilities
      --}
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        -- NOTE: Enable this to troubleshoot tsserver
        --init_options = {
        --  tsserver = {
        --    logDirectory = '/path/to/tsserver-logs',
        --    logVerbosity = 'verbose',
        --  },
        --},
      }
      lspconfig.jdtls.setup {
        capabilities = capabilities
      }
      lspconfig.terraformls.setup {
        capabilities = capabilities
      }

      if not configs.protobuf_pls then
        configs.protobuf_pls = {
          default_config = {
            cmd = { 'pls' },
            filetypes = { 'proto' },
            root_dir = function(fname)
              return lspconfig.util.find_git_ancestor(fname)
            end
          },
        }
      end
      lspconfig.protobuf_pls.setup{
        capabilities = capabilities
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require'copilot_cmp'.setup()
    end
  },
  {
    "lttr/cmp-jira",
    config = function ()
      require'cmp_jira'.setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      --"quangnguyen30192/cmp-nvim-ultisnips",
      "zbirenbaum/copilot-cmp",
      "onsails/lspkind.nvim",
      "lttr/cmp-jira",
    },
    config = function()
      -- @source: https://github.com/hrsh7th/nvim-cmp/?tab=readme-ov-file#recommended-configuration
      -- @source: https://github.com/onsails/lspkind.nvim?tab=readme-ov-file#option-2-nvim-cmp
      -- @source: https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#highlighting--icon
      -- Set up nvim-cmp.
      local cmp = require'cmp'
      local lspkind = require'lspkind'

      cmp.setup({
      --  snippet = {
      --    expand = function(args)
      --      vim.fn["UltiSnips#Anon"](args.body)
      --    end,
      --  },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp' },
        --    { name = 'ultisnips' },
          }, {
            {
              name = 'buffer',
              option = {
                get_bufnrs = function()
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
                end
              },
            },
          },
          {
            { name = "copilot", group_index = 2 }
          }
        ),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '…',
            show_labelDetails = true,
            symbol_map = { Copilot = "" },
          }),
        },
      })

      -- Set configuration for specific filetype.
      for i, fileType in ipairs({'gitcommit', 'jjdescription'}) do
        cmp.setup.filetype(fileType, {
          sources = cmp.config.sources(
            {
              { name = "jira" },
            },
            {
              { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            },
            {
              { name = 'buffer' },
            }
          ),
          formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol',
              maxwidth = 100,
              ellipsis_char = '…',
              show_labelDetails = true,
              symbol_map = {
                Copilot = "",
                Jira = "󰌃",
              },
            }),
          },
        })
      end

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },
  -- Possible replacement: https://github.com/typescript-language-server/typescript-language-server.
  -- Read http://shortn/hy55K.
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    config = true,
  }
}