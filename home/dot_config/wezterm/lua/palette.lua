-- palette.lua
-- Single source of truth for all UI colours.
-- To switch themes: change M.active at the bottom of this file.
local M = {}

M.nord = {
  bg        = '#2e3440',  -- Nord0  - main background
  bg_dim    = '#262c36',  -- darker Nord0 for tab bar trough
  bg_subtle = '#3b4252',  -- Nord1  - hover / raised surfaces
  border    = '#434c5e',  -- Nord2  - subtle borders
  fg_muted  = '#4c566a',  -- Nord3  - muted / inactive text
  fg_dim    = '#616e88',  -- between Nord3 and Nord4
  fg        = '#d8dee9',  -- Nord4  - normal text
  fg_bright = '#eceff4',  -- Nord6  - bright / active text
  accent    = '#88c0d0',  -- Nord8  - primary cyan accent
  green     = '#a3be8c',  -- Nord14
  yellow    = '#ebcb8b',  -- Nord13
}

-- Active theme — change this line to switch
M.active = M.nord

return M
