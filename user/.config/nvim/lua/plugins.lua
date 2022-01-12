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

    use {
      'rakr/vim-one',
      config = function()
        vim.o.termguicolors = true
        vim.o.background = 'dark'
        vim.cmd('colorscheme one')
      end
    }
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
        require('lualine').setup{options = {theme = 'onedark'}}
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
        'neovim/nvim-lspconfig',
        opt = true,
        config = function()
            require('lspconfig').pyright.setup{}
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

    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
