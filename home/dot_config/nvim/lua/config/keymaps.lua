-- ~/.config/nvim/lua/config/keymaps.lua
-- mapleader is set in config/lazy.lua before lazy loads

------------------------------------------------------------------
-- General
------------------------------------------------------------------
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { noremap = true, silent = true })       -- clear search highlight
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { noremap = true, silent = true })        -- save
vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>', { noremap = true, silent = true })         -- quit
vim.keymap.set('n', '<leader>x', '<cmd>wq<CR>', { noremap = true, silent = true })           -- save and quit

------------------------------------------------------------------
-- Navigation — better j/k for wrapped lines
------------------------------------------------------------------
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

------------------------------------------------------------------
-- Splits
------------------------------------------------------------------
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<CR>', { noremap = true, silent = true })   -- vertical split
vim.keymap.set('n', '<leader>sh', '<cmd>split<CR>', { noremap = true, silent = true })    -- horizontal split
vim.keymap.set('n', '<leader>se', '<cmd>wincmd =<CR>', { noremap = true, silent = true }) -- equalise splits
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { noremap = true, silent = true })    -- close split

-- Navigate splits with CTRL+hjkl — mirrors WezTerm pane navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

------------------------------------------------------------------
-- Buffers
------------------------------------------------------------------
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { noremap = true, silent = true })     -- next buffer
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { noremap = true, silent = true }) -- previous buffer
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { noremap = true, silent = true })   -- delete buffer

------------------------------------------------------------------
-- Visual mode
------------------------------------------------------------------
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })               -- indent left, stay in visual
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })               -- indent right, stay in visual
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })  -- move selection down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })  -- move selection up
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true })              -- paste without losing register
