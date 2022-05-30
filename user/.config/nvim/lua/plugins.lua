local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Themes
    use {
      'lifepillar/vim-solarized8',
      config = function()
        vim.cmd[[set background=dark]]
        vim.cmd[[colorscheme solarized8]]
      end
    }
    -- use {
    --   'folke/tokyonight.nvim',
    --   config = function()
    --     vim.g.tokyonight_style = "storm"
    --     vim.cmd[[colorscheme tokyonight]]
    --   end
    -- }
    -- use {
    --   'tyrannicaltoucan/vim-deep-space',
    --   config = function()
    --     vim.cmd[[let g:deepspace_italics=1]]
    --     vim.cmd[[set background=dark]]
    --     vim.cmd[[set termguicolors]]
    --     vim.cmd[[colorscheme deep-space]]
    --   end
    -- }
    -- use {
    --   'sainnhe/sonokai',
    --   config = function()
    --     vim.g.sonokai_enable_italic = 1
    --     vim.g.sonokai_disable_italic_comment = 1
    --     vim.cmd('colorscheme sonokai')
    --   end
    -- }

    -- use 'zsugabubus/crazy8.nvim' -- detects tab size
    use 'Darazaki/indent-o-matic' -- detects tab size
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function()
        vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
        require('nvim-tree').setup{
          view = {
            width = 60,
            mappings = {
              list = {
                { key = "?", action = "toggle_help" },
                { key = "<C-e>", action = "" },
              }
            }
          }
        }
      end
    }
    use 'dyng/ctrlsf.vim'
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-commentary'
    use {
      'karb94/neoscroll.nvim',
      config = function()
        require('neoscroll').setup{
          easing_function = nil,
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zz'},
        }
        require('neoscroll.config').set_mappings{
          ['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}},
          ['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}},
          ['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '100'}},
          ['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '100'}},
          ['<C-y>'] = {'scroll', {'-3', 'false', '30'}},
          ['<C-e>'] = {'scroll', { '3', 'false', '30'}},
          ['zz']    = {'zz', {'100'}},
        }
      end
    }
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        vim.cmd('set noshowmode')
        require('lualine').setup{
          options = {
            icons_enabled = false,
            theme = 'solarized_dark',
            -- component_separators = { left = '', right = ''},
            -- section_separators = { left = '', right = ''},
            component_separators = { left = '│', right = '│'},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = false,
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {{'diagnostics', colored = false,}},
            lualine_c = {
              {
                'filename',
                file_status = true,      -- Displays file status (readonly status, modified status)
                path = 1,                -- 0: Just the filename
                                         -- 1: Relative path
                                         -- 2: Absolute path
                                         -- 3: Absolute path, with tilde as the home directory
                shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                         -- for other components. (terrible name, any suggestions?)
                symbols = {
                  modified = '[*]',      -- Text to show when the file is modified.
                  readonly = '[R/O]',    -- Text to show when the file is non-modifiable or readonly.
                  unnamed = '[No Name]', -- Text to show for unnamed buffers.
                }
              }
            },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
          tabline = {},
          extensions = {}
      }
      end
    }
    use 'rmagatti/auto-session'
    use {
      'akinsho/toggleterm.nvim',
      branch = 'main',
      config = function()
        require("toggleterm").setup{
          -- size = 20,
          open_mapping = [[<C-CR>]],
          -- hide_numbers = true,
          -- shade_filetypes = {},
          -- shade_terminals = true,
          -- shading_factor = 2,
          -- start_in_insert = true,
          -- insert_mappings = true,
          -- persist_size = true,
          direction = "horizontal",
          -- close_on_exit = true,
          -- shell = vim.o.shell,
        }
        function _G.set_terminal_keymaps()
          local opts = {noremap = true}
          vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
          -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
          -- vim.api.nvim_buf_set_keymap(0, 't', 'kj', [[<C-\><C-n>]], opts)
          vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
          vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
          vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
          vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
        end
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
      end
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config= function()
        require('telescope').setup{
          defaults = {
            path_display={"smart"}
          }
        }
      end
    }
    use 'folke/which-key.nvim'
    use {
      "petertriho/nvim-scrollbar",
      config = function()
        -- Dark one theme
        require("scrollbar").setup {
          handle = {
            color = "#393f4a"
          },
          marks = {
            Search = { color = "#d19a66" },
            Error = { color = "#e86671" },
            Warn = { color = "#e5c07b" },
            Info = { color = "#61afef" },
            Hint = { color = "#61afef" },
            Misc = { color = "#c678dd" },
          }
        }
      end
    }
    -- use {
    --   'RRethy/vim-hexokinase',
    --   run = 'make hexokinase',
    --   config = function()
    --     vim.cmd("let g:Hexokinase_highlighters = ['backgroundfull']")
    --   end
    -- }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = {"bash", "c", "cmake", "cpp", "css", "dart", "html", "json", "json5"},
          sync_install = false,
          autopairs = {
            enable = true,
          },
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
          },
          indent = { enable = true, disable = { "yaml" } },
          context_commentstring = {
            enable = true,
            enable_autocmd = false,
          },
        }
      end
    }
    use {
      'p00f/nvim-ts-rainbow',
      config = function()
        require("nvim-treesitter.configs").setup {
          rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
          }
        }
      end
    }
    use 'itchyny/vim-cursorword'

    -- IDE plugins
    use {
      'neovim/nvim-lspconfig',
      opt = true,
    }
    use {
      "williamboman/nvim-lsp-installer",
      requires = 'neovim/nvim-lspconfig',
      opt = true,
      config = function()
        local lsp_installer = require "nvim-lsp-installer"

        -- Include the servers you want to have installed by default below
        local servers = {
          "pyright",
          "sumneko_lua",
          "dartls",
          "clangd",
        }

        for _, name in pairs(servers) do
          local server_is_found, server = lsp_installer.get_server(name)
          if server_is_found then
            if not server:is_installed() then
              print("Installing " .. name)
              server:install()
            end
          end
        end

        lsp_installer.on_server_ready(function(server)
          server:setup({})
        end)
      end
    }
    use {
      'hrsh7th/cmp-nvim-lsp',
      opt = true,
    }
    use {
      'hrsh7th/nvim-cmp',
      opt = true,
      require = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
      },
      config = function()
        vim.cmd("set completeopt=menu,menuone,noselect")
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
          },
          window = {},
          mapping = cmp.mapping.preset.insert({
            ['<C-j>'] = cmp.mapping.scroll_docs(-4),
            ['<C-k>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              -- elseif vim.fn["vsnip#available"](1) == 1 then
              --   feedkey("<Plug>(vsnip-expand-or-jump)", "")
              -- elseif has_words_before() then
              --   cmp.complete()
              else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function()
              if cmp.visible() then
                cmp.select_prev_item()
              -- elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              --   feedkey("<Plug>(vsnip-jump-prev)", "")
              end
            end, { "i", "s" }),
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
          }, {
            { name = 'buffer' },
          })
        })
        -- Setup lspconfig.
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        require('lspconfig')['clangd'].setup {
          capabilities = capabilities
        }
      end
    }

    use {
      'puremourning/vimspector',
      opt = true,
      config = function()
        vim.cmd("packadd! vimspector")
      end
    }
    use {
      'APZelos/blamer.nvim',
      opt = true,
      config = function()
        vim.cmd("BlamerShow")
      end
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      opt = true,
      config = function()
        require("indent_blankline").setup {}
      end
    }
    use {
      "airblade/vim-gitgutter",
      opt = true,
      config = function()
        vim.cmd("autocmd! gitgutter CursorHold,CursorHoldI")
        vim.cmd("autocmd BufWritePost * :GitGutter")
        vim.cmd("GitGutterAll")
      end
    }
    use {
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    -- Language plugins
    use {
      'akinsho/flutter-tools.nvim',
      opt = true,
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require("flutter-tools").setup{}
      end
    }

    -- Automatically set up configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
