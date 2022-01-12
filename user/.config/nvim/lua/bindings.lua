-- Map leader to Space
vim.g.mapleader = " "

local normalBindings = {
    ["<leader>"] = "which_key_ignore",
    s = {"<cmd>:w<CR>", "Save File"},
    e = {"<cmd>NvimTreeToggle<CR>", "Toggle Explorer"},
    j = {"<Plug>(easymotion-overwin-f)", "Jump to"},
    f = {
        name = "Find",
        f = {"<cmd>CtrlSFToggle<CR>", "Toggle Window"},
        c = {"<Plug>CtrlSFCwordPath -W<CR>", "Currect word"},
        t = {':CtrlSF -R -I ""<Left>', "Text", silent = false},
    },
    t = {
        name = "Telescope",
        t = {"<cmd>Telescope resume<cr>", "Toggle Window" },
        f = {"<cmd>Telescope find_files<cr>", "File" },
        b = {"<cmd>Telescope buffers<cr>", "Buffer"},
        g = {"<cmd>Telescope live_grep<cr>", "Grep Text"},
        h = {"<cmd>Telescope help_tags<cr>", "Help Tag"},
    },
    p = {
        name = "Packer",
        s = {"<cmd>PackerSync<cr>", "Sync" },
        u = {"<cmd>PackerUpdate<cr>", "Update" },
        i = {"<cmd>PackerInstall<cr>", "Install" },
        t = {"<cmd>PackerStatus<cr>", "Status" },
        l = {"<cmd>PackerClean<cr>", "Clean" },
        c = {"<cmd>PackerCompile<cr>", "Compile" },
    },
    o = {
        name = "Open",
        n = {"<cmd>enew<CR>", "New buffer"},
        f = {":e ", "File", silent = false},
    },
}

local ideBindings = {
    d = {
        name = "Debug",
        b = {"<Plug>VimspectorBalloonEval", "Show Details"},
        d = {"<cmd>VimspectorReset<CR>", "Hide"},
        u = {"<cmd>VimspectorUpdate<CR>", "Update"},
        o = {"<cmd>VimspectorShowOutput<CR>", "Show Output"},
        l = {"<cmd>VimspectorToggleLog<CR>", "Toggle Log"},
        i = {"<cmd>VimspectorInstall<CR>", "Install"},
        s = {"<cmd>VimspectorMkSession<CR>", "Save session"},
        r = {"<cmd>VimspectorLoadSession<CR>", "Restore session"},
    },
    g = {
        name = "Git",
        g = {"<cmd>GitGutterToggle<CR>", "Toggle Gutter"},
        s = {"<cmd>GitGutterStageHunk<CR>", "Stage Hunk"},
        u = {"<cmd>GitGutterUndoHunk<CR>", "Undo Hunk"},
        v = {"<cmd>GitGutterPreviewHunk<CR>", "View Hunk"},
        n = {"<cmd>GitGutterNextHunk<CR>", "Next Hunk"},
        p = {"<cmd>GitGutterPrevHunk<CR>", "Prev Hunk"},
    },
}

function setIdeMode()
    plugins = {
        "vimspector",
        "blamer.nvim",
        "indent-blankline.nvim",
        "vim-gitgutter",
        'nvim-lspconfig',
        'coq_nvim',
    }
    require("packer.load")(plugins, {}, _G.packer_plugins)

    local bindings = {}
    for k, v in pairs(normalBindings) do
        bindings[k] = v
    end
    for k, v in pairs(ideBindings) do
        bindings[k] = v
    end

    local leaderBindings = require("which-key")
    leaderBindings.register(bindings, {prefix="<leader>"})
    leaderBindings.setup()

    print("IDE Mode On")
end

normalBindings["l"] = {
    name = "Load",
    h = {setIdeMode, "Heroic Mode"},
}

-- Setup normal mode leader bindings
local leaderBindings = require("which-key")
leaderBindings.register(normalBindings, {prefix="<leader>"})
leaderBindings.setup()

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
bind('n', '<A-c>', ':BufferClose<CR>', noremapSilent)

-- Plug 'akinsho/toggleterm.nvim'
bind('n', '<CR>', ':ToggleTerm<CR>', noremapSilent)

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


-- Vimspector
bind('n', '<F4>', '<Plug>VimspectorStop', silent)
bind('n', '<F5>', '<Plug>VimspectorContinue', silent)
bind('n', '<F6>', '<Plug>VimspectorPause', silent)

bind('n', '<F8>', '<Plug>VimspectorToggleConditionalBreakpoint', silent)
bind('n', '<F9>', '<Plug>VimspectorToggleBreakpoint', silent)

bind('n', '<F10>', '<Plug>VimspectorStepOver', silent)
bind('n', '<F11>', '<Plug>VimspectorStepInto', silent)
bind('n', '<F12>', '<Plug>VimspectorStepOut', silent)
