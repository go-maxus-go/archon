-- Map leader to Space
vim.g.mapleader = " "

-- Other bindings
local bind = vim.api.nvim_set_keymap
local silent = { silent = true }
local noremap = { noremap = true }
local noremapSilent = { noremap = true, silent = true }

-- Plug 'tpope/vim-commentary'
bind('n', '<C-_>', ':Commentary<CR>', noremap)
bind('v', '<C-_>', ':Commentary<CR>', noremap)

-- Plug 'romgrk/barbar.nvim'
bind('n', '<A-,>', ':BufferPrevious<CR>', noremapSilent)
bind('n', '<A-.>', ':BufferNext<CR>', noremapSilent)

bind('n', '<A-<>', ':BufferMovePrevious<CR>', noremapSilent)
bind('n', '<A->>', ':BufferMoveNext<CR>', noremapSilent)

for i = 1,9 do
    bind('n', '<A-'..i..'>', ':BufferGoto '..i..'<CR>', noremapSilent)
end
bind('n', '<A-0>', ':BufferLast<CR>', noremapSilent)
bind('n', '<A-c>', ':BufferClose!<CR>', noremapSilent)

-- Swap ; and : for faster entering in command mode
bind('n', ';', ':', noremap)
bind('n', ':', ';', noremap)

-- Go to normal mode
bind('i', 'jk', '<Esc>', noremap)
bind('i', 'kj', '<Esc>', noremap)

-- Case insensitive search
bind('n', '/', '/\\c', noremap)

-- Save file
bind('n', '<C-s>', '<cmd>:w<CR>', noremapSilent)
bind('i', '<C-s>', '<cmd>:w<CR>', noremapSilent)

-- Move current line / block with Alt-j/k ala vscode.
bind('i', '<A-j>', '<Esc>:m .+1<CR>==gi', noremapSilent)
bind('i', '<A-k>', '<Esc>:m .-2<CR>==gi', noremapSilent)
bind('n', '<A-j>', ':m .+1<CR>==', noremapSilent)
bind('n', '<A-k>', ':m .-2<CR>==', noremapSilent)
bind('v', '<A-j>', ":m '>+1<CR>gv-gv", noremapSilent)
bind('v', '<A-k>', ":m '<-2<CR>gv-gv", noremapSilent)

-- Reselect new indentation in visual mode
bind('v', '<', '<gv', noremapSilent)
bind('v', '>', '>gv', noremapSilent)

-- Wild menu navigation
bind('c', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
bind('c', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })

bind('c', '<up>', 'wildmenumode() ? "<left>" : "<up>"', { expr = true, noremap = true })
bind('c', '<down>', 'wildmenumode() ? "<right>" : "<down>"', { expr = true, noremap = true })

-- Window movement
bind('n', '<C-h>', '<C-w>h', noremapSilent)
bind('n', '<C-j>', '<C-w>j', noremapSilent)
bind('n', '<C-k>', '<C-w>k', noremapSilent)
bind('n', '<C-l>', '<C-w>l', noremapSilent)

-- Window resize
bind('n', '<C-A-h>', ':vertical resize -2<CR>', noremapSilent)
bind('n', '<C-A-j>', ':resize +2<CR>', noremapSilent)
bind('n', '<C-A-k>', ':resize -2<CR>', noremapSilent)
bind('n', '<C-A-l>', ':vertical resize +2<CR>', noremapSilent)

-- Copy and paste
bind('v', 'p', '"_dP', noremapSilent)

-- Vimspector
-- bind('n', '<F5>', '<Plug>VimspectorContinue', silent)
-- bind('n', '<F6>', '<Plug>VimspectorPause', silent)
--
-- bind('n', '<F8>', '<Plug>VimspectorToggleConditionalBreakpoint', silent)
-- bind('n', '<F9>', '<Plug>VimspectorToggleBreakpoint', silent)
--
-- bind('n', '<F10>', '<Plug>VimspectorStepOver', silent)
-- bind('n', '<F11>', '<Plug>VimspectorStepInto', silent)
-- bind('n', '<F12>', '<Plug>VimspectorStepOut', silent)

-- local ideModeBindings = {
--     d = {
--         name = "Debug",
--         b = {"<Plug>VimspectorBalloonEval", "Show Details"},
--         d = {"<cmd>VimspectorReset<CR>", "Hide"},
--         u = {"<cmd>VimspectorUpdate<CR>", "Update"},
--         o = {"<cmd>VimspectorShowOutput<CR>", "Show Output"},
--         l = {"<cmd>VimspectorToggleLog<CR>", "Toggle Log"},
--         i = {"<cmd>VimspectorInstall<CR>", "Install"},
--         s = {"<cmd>VimspectorMkSession<CR>", "Save session"},
--         r = {"<cmd>VimspectorLoadSession<CR>", "Restore session"},
--     },
--     g = {
--         name = "Git",
--         g = {"<cmd>GitGutterToggle<CR>", "Toggle Gutter"},
--         s = {"<cmd>GitGutterStageHunk<CR>", "Stage Hunk"},
--         u = {"<cmd>GitGutterUndoHunk<CR>", "Undo Hunk"},
--         v = {"<cmd>GitGutterPreviewHunk<CR>", "View Hunk"},
--         n = {"<cmd>GitGutterNextHunk<CR>", "Next Hunk"},
--         p = {"<cmd>GitGutterPrevHunk<CR>", "Prev Hunk"},
--     },
--     i = {
--         name = "IDE",
--         f = {'<cmd>silent exec "!clang-format -i %"<CR>', "Clang Format"},
--     },
-- }

-- function setIdeMode()
--     plugins = {
--         'nvim-lspconfig',
--         "nvim-lsp-installer",
--         "vimspector",
--         "blamer.nvim",
--         "indent-blankline.nvim",
--         "vim-gitgutter",
--         'nvim-treesitter',
--         'nvim-ts-rainbow',
--         -- Autocompletion
--         'cmp-nvim-lsp',
--         'nvim-cmp',
--         -- Languages
--         'flutter-tools.nvim',
--     }
--     require("packer.load")(plugins, {}, _G.packer_plugins)
--
--     local bindings = {}
--     for k, v in pairs(normalModeBindings) do
--         bindings[k] = v
--     end
--     for k, v in pairs(ideModeBindings) do
--         bindings[k] = v
--     end
--
--     local whichKey = require("which-key")
--     whichKey.register(bindings, {prefix="<leader>"})
--     whichKey.setup()
--
--     bind('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', noremapSilent)
--     bind('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', noremapSilent)
--     bind('n', '<A-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', noremapSilent)
--     -- bind('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', noremapSilent)
--     bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', noremapSilent)
--     -- bind('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', noremapSilent)
--     bind('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', noremapSilent)
--     bind('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', noremapSilent)
--     -- bind('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', noremapSilent)
--     bind('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', noremapSilent)
--     bind('n', '<F4>', '<cmd>ClangdSwitchSourceHeader<CR>', noremapSilent)
--
--     print("IDE Mode On")
-- end

-- normalModeBindings["l"] = {
--     name = "Load",
--     i = {setIdeMode, "IDE"},
-- }

-- Setup normal mode leader bindings
local whichKey = require("which-key")
-- whichKey.register(normalModeBindings, {prefix="<leader>"})
whichKey.add({
  { "<leader><leader>", hidden = true },
  { "<leader>e", group = "File Explorer" },
  { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Explorer" },
  { "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "Find Current File" },
  { "<leader>f", group = "Find" },
  { "<leader>fc", "<Plug>CtrlSFCwordPath -W<CR>", desc = "Currect word" },
  { "<leader>ff", "<cmd>CtrlSFToggle<CR>", desc = "Toggle Window" },
  { "<leader>ft", ':CtrlSF -R -I ""<Left>', desc = "Text", silent = false },
  { "<leader>j", "<Plug>(easymotion-overwin-f)", desc = "Jump to" },
  { "<leader>o", group = "Open" },
  { "<leader>of", ":e ", desc = "File", silent = false },
  { "<leader>on", "<cmd>enew<CR>", desc = "New buffer" },
  { "<leader>p", group = "Packer" },
  { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile" },
  { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install" },
  { "<leader>pl", "<cmd>PackerClean<cr>", desc = "Clean" },
  { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync" },
  { "<leader>pt", "<cmd>PackerStatus<cr>", desc = "Status" },
  { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update" },
  { "<leader>s", "<cmd>:w<CR>", desc = "Save File" },
  { "<leader>t", group = "Telescope" },
  { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffer" },
  { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "File" },
  { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Grep Text" },
  { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Help Tag" },
  { "<leader>tt", "<cmd>Telescope resume<cr>", desc = "Toggle Window" },
  { "<leader>w", "<cmd>set wrap!<CR>", desc = "Toggle Word Wrap" },
})
whichKey.setup()

