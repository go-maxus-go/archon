local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'rakr/vim-one'
  -- use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('nvim-tree').setup {} end
  }
  use 'kien/ctrlp.vim'
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
    config = function() 
      vim.g.bufferline = {auto_hide = true}
    end
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

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
