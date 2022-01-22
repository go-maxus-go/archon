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
      'tyrannicaltoucan/vim-deep-space',
      config = function()
        vim.cmd[[let g:deepspace_italics=1]]
        vim.cmd[[set background=dark]]
        vim.cmd[[set termguicolors]]
        vim.cmd[[colorscheme deep-space]]
      end
    }
    -- use {
    --   'lifepillar/vim-solarized8',
    --   config = function()
    --     vim.cmd[[colorscheme solarized8]]
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
    -- use {
    --   'folke/tokyonight.nvim',
    --   config = function()
    --     vim.cmd('colorscheme tokyonight')
    --   end
    -- }
    -- use {
    --   'Mofiqul/vscode.nvim',
    --   config = function()
    --     vim.g.vscode_style = "dark"
    --     vim.g.vscode_transparent = 1
    --     vim.g.vscode_italic_comment = 1
    --     vim.cmd[[colorscheme vscode]]
    --   end
    -- }
    -- use {
    --   'joshdick/onedark.vim',
    --   config = function()
    --     vim.cmd[[colorscheme onedark]]
    --   end
    -- }

    -- use 'zsugabubus/crazy8.nvim' -- detects tab size
    use 'Darazaki/indent-o-matic' -- detects tab size
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function() require('nvim-tree').setup {} end
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
        require('lualine').setup{}
      end
    }
    use 'rmagatti/auto-session'
    use 'akinsho/toggleterm.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
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
      'ms-jpq/coq_nvim',
      opt = true,
      branch = 'coq',
      config = function()
        vim.g.coq_settings = {
          auto_start = "shut-up",
          keymap = {
            pre_select = false,
            jump_to_mark = "",
          },
          display = {
            icons = {
              mode = 'none',
            },
            pum = {
              fast_close = false,
            },
          },
        }
        vim.cmd("COQnow")
      end
    }
    -- use {
    --   'sindrets/diffview.nvim',
    --   requires = 'nvim-lua/plenary.nvim'
    -- }
    use {
      'nvim-treesitter/nvim-treesitter',
      opt = true,
      run = ':TSUpdate',
      config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = "maintained",
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
