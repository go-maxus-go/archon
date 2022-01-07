pluginsCommand = [[
    Plug 'rakr/vim-one'

    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'kien/ctrlp.vim'
    Plug 'dyng/ctrlsf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'karb94/neoscroll.nvim'
]]
vim.cmd('call plug#begin()\n' .. pluginsCommand .. 'call plug#end()')

-- Map leader to Space
vim.g.mapleader = " "

-- Plug 'rakr/vim-one'
vim.o.termguicolors = true -- 24-bit terminal
vim.cmd('colorscheme one')
vim.o.background = 'dark'

-- Plug 'kyazdani42/nvim-tree.lua'
-- g? shows help
require'nvim-tree'.setup()
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', {noremap = true})

-- Plug 'dyng/ctrlsf.vim'
--let g:ctrlsf_ackprg = '/usr/bin/rg'
vim.cmd('let g:ctrlsf_auto_focus={"at": "start"}')
vim.g.ctrlsf_default_view_mode = 'compact'

-- Plug 'dyng/ctrlsf.vim'
-- Set default recursive case insensitive search
vim.api.nvim_set_keymap('n', '<Leader>F', ':CtrlSF -R -I ""<Left>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>f', ':CtrlSFToggle<CR>', {noremap = true})
-- Find the word under the cursor
vim.api.nvim_set_keymap('n', '<Leader>w', '<Plug>CtrlSFCwordPath -W<CR>', {})
vim.o.modifiable = true -- for find and replace
-- 'p' can be used for to open search preview
-- find and replace can be done in the result buffer
-- using a command like :%s/foo/bar/g

-- Plug 'easymotion/vim-easymotion'
vim.api.nvim_set_keymap('n', '<Leader>m', '<Plug>(easymotion-overwin-f)', {})

-- Plug 'tpope/vim-commentary'
vim.api.nvim_set_keymap('n', '<C-_>', ':Commentary<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-_>', ':Commentary<CR>', {noremap = true})

-- Plug 'karb94/neoscroll.nvim'
require('neoscroll').setup({
    easing_function = nil,
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zz'},
})
local scrollConfig = {}
scrollConfig['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
scrollConfig['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}
scrollConfig['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '100'}}
scrollConfig['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '100'}}
scrollConfig['<C-y>'] = {'scroll', {'-3', 'false', '30'}}
scrollConfig['<C-e>'] = {'scroll', { '3', 'false', '30'}}
scrollConfig['zz']    = {'zz', {'100'}}
require('neoscroll.config').set_mappings(scrollConfig)

-- General
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.ff = 'unix'

-- Enable invisible symbols
vim.o.list = true
vim.o.listchars = 'space:·,tab:>·'

-- Config tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Swap ; and : for faster entering in command mode
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('n', ':', ';', {noremap = true})

-- Enable copying to system clipboard, xclip is required
vim.o.clipboard = 'unnamedplus'

-- Go to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true})

-- Case insensitive search
vim.api.nvim_set_keymap('n', '/', '/\\c', {noremap = true})
--vim.api.nvim_set_keymap('n', '?', '?\c', {noremap = true})

-- Prepare for drag and drop a file into a new tab
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabedit ', {noremap = true})
-- nnoremap <C-n> :tabnew<CR>
