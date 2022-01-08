local pluginsCommand = [[
    Plug 'rakr/vim-one'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kien/ctrlp.vim'
    Plug 'dyng/ctrlsf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'karb94/neoscroll.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'rmagatti/auto-session'
    Plug 'akinsho/toggleterm.nvim'
]]
vim.cmd('call plug#begin()\n' .. pluginsCommand .. 'call plug#end()')

-- Map leader to Space
vim.g.mapleader = " "

-- Key map helpers
local bind =vim.api.nvim_set_keymap
local silent = { silent = true }
local noremap = { noremap = true }
local noremapSilent = { noremap = true, silent = true }

-- Plug 'rakr/vim-one'
vim.o.termguicolors = true -- 24-bit terminal
vim.cmd('colorscheme one')
vim.o.background = 'dark'

-- Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'kyazdani42/nvim-tree.lua'
-- g? shows help
require'nvim-tree'.setup()
bind('n', '<Leader>n', ':NvimTreeToggle<CR>', noremap)

-- Plug 'dyng/ctrlsf.vim'
--let g:ctrlsf_ackprg = '/usr/bin/rg'
vim.cmd('let g:ctrlsf_auto_focus={"at": "start"}')
vim.g.ctrlsf_default_view_mode = 'compact'

-- Plug 'dyng/ctrlsf.vim'
-- Set default recursive case insensitive search
bind('n', '<Leader>F', ':CtrlSF -R -I ""<Left>', noremap)
bind('n', '<Leader>f', ':CtrlSFToggle<CR>', noremap)
-- Find the word under the cursor
bind('n', '<Leader>w', '<Plug>CtrlSFCwordPath -W<CR>', {})
vim.o.modifiable = true -- for find and replace
-- 'p' can be used for to open search preview
-- find and replace can be done in the result buffer
-- using a command like :%s/foo/bar/g

-- Plug 'easymotion/vim-easymotion'
bind('n', '<Leader>m', '<Plug>(easymotion-overwin-f)', {})

-- Plug 'tpope/vim-commentary'
bind('n', '<C-_>', ':Commentary<CR>', noremap)
bind('v', '<C-_>', ':Commentary<CR>', noremap)

-- Plug 'karb94/neoscroll.nvim'
require('neoscroll').setup{
    easing_function = nil,
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zz'},
}
require('neoscroll.config').set_mappings({
    ['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}},
    ['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}},
    ['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '100'}},
    ['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '100'}},
    ['<C-y>'] = {'scroll', {'-3', 'false', '30'}},
    ['<C-e>'] = {'scroll', { '3', 'false', '30'}},
    ['zz']    = {'zz', {'100'}},
})

-- Plug 'romgrk/barbar.nvim'
vim.g.bufferline = {auto_hide = true}

bind('n', '<A-,>', ':BufferPrevious<CR>', noremapSilent)
bind('n', '<A-.>', ':BufferNext<CR>', noremapSilent)

bind('n', '<A-<>', ':BufferMovePrevious<CR>', noremapSilent)
bind('n', '<A->>', ':BufferMoveNext<CR>', noremapSilent)

for i = 1,9 do
    bind('n', '<A-'..i..'>', ':BufferGoto '..i..'<CR>', noremapSilent)
end
bind('n', '<A-0>', ':BufferLast<CR>', noremapSilent)

bind('n', '<A-c>', ':BufferClose<CR>', noremapSilent)

-- Plug 'nvim-lualine/lualine.nvim'
require('lualine').setup{options = {theme = 'onedark'}}

-- Plug 'rmagatti/auto-session'
require('auto-session').setup()

-- Plug 'akinsho/toggleterm.nvim'
-- vim.cmd("let g:toggleterm_terminal_mapping = '<CR>'")
require("toggleterm").setup()
bind('n', '<CR>', ':ToggleTerm<CR>', noremapSilent)

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
bind('n', ';', ':', noremap)
bind('n', ':', ';', noremap)

-- Enable copying to system clipboard, xclip is required
vim.opt.clipboard:append('unnamedplus')

-- Go to normal mode
bind('i', 'jk', '<Esc>', noremap)
bind('i', 'kj', '<Esc>', noremap)

-- Case insensitive search
bind('n', '/', '/\\c', noremap)

-- Prepare for drag and drop a file into a new buffer
bind('n', '<Leader>e', ':e ', noremap)
