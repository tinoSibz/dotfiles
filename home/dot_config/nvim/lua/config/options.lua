-- ~/.config/nvim/lua/config/options.lua

------------------------------------------------------------------
-- UI
------------------------------------------------------------------
vim.opt.number         = true  -- absolute line number on current line
vim.opt.relativenumber = true  -- relative line numbers
vim.opt.cursorline     = true  -- highlight current line
vim.opt.signcolumn     = 'yes' -- always show — used by LSP and diagnostics
vim.opt.termguicolors  = true  -- true colour support
vim.opt.scrolloff      = 8     -- keep 8 lines above/below cursor
vim.opt.sidescrolloff  = 8     -- keep 8 columns left/right of cursor
vim.opt.wrap           = false -- no line wrapping
vim.opt.linebreak      = true  -- if wrap enabled, break at word boundaries
vim.opt.splitright     = true  -- vertical splits open to the right
vim.opt.splitbelow     = true  -- horizontal splits open below
vim.opt.showmode       = false -- mode shown in statusline

------------------------------------------------------------------
-- Status line
------------------------------------------------------------------
vim.opt.laststatus     = 2
vim.opt.statusline     = table.concat({
	' %F',        -- full file path
	' %m%r%h%w',  -- modified, readonly, help, preview flags
	'%=',         -- switch to right side
	' %{&filetype}', -- file type
	' | %l/%L',   -- current line / total lines
	' %p%% ',     -- percentage through file
})

------------------------------------------------------------------
-- Indentation
------------------------------------------------------------------
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.autoindent     = true
vim.opt.smartindent    = true

------------------------------------------------------------------
-- Search
------------------------------------------------------------------
vim.opt.incsearch      = true
vim.opt.hlsearch       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

------------------------------------------------------------------
-- Behaviour
------------------------------------------------------------------
vim.opt.hidden         = true
vim.opt.updatetime     = 300
vim.opt.encoding       = 'utf-8'
vim.opt.fileencoding   = 'utf-8'
vim.opt.backspace      = 'indent,eol,start'
vim.opt.clipboard      = 'unnamedplus' -- use system clipboard
vim.opt.mouse          = 'a'           -- enable mouse in all modes

vim.opt.title          = true
vim.opt.titlestring    = '%{expand("%:~")} — nvim'
