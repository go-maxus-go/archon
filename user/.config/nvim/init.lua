require('plugins')
require('bindings')

-- Plug 'dyng/ctrlsf.vim'
--let g:ctrlsf_ackprg = '/usr/bin/rg'
vim.cmd('let g:ctrlsf_auto_focus={"at": "start"}')
vim.g.ctrlsf_default_view_mode = 'compact'

-- Plug 'dyng/ctrlsf.vim'
-- Set default recursive case insensitive search
vim.o.modifiable = true -- for find and replace

-- General
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.ff = 'unix'
vim.o.updatetime = 1000
vim.o.termguicolors = true
-- vim.cmd("autocmd FileType * set formatoptions-=o") -- doesn't work

-- Enable invisible symbols
vim.o.list = true
vim.o.listchars = 'space:⸱,tab:>⸱'

-- Remove trailing whitespaces
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- Config tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Case sensitivity
vim.o.ignorecase = true
vim.o.smartcase = true

-- Wild menu
vim.o.wildignorecase = true
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

-- Enable copying to system clipboard, xclip is required
vim.opt.clipboard:append('unnamedplus')

-- Vimspector
vim.cmd("let g:vimspector_install_gadgets = [ 'debugpy' ]")

-- Blamer
vim.api.nvim_set_var("blamer_date_format", "%d.%m.%y")
vim.api.nvim_set_var("blamer_template",
    "<commit-short> <committer> <committer-time> <summary>")
