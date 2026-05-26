local wezterm    = require('wezterm')
local config     = wezterm.config_builder()

local appearance = require('lua.appearance')
local tabbar     = require('lua.tabbar')
local keymaps    = require('lua.keymaps')
-- local projects   = require('lua.projects')

appearance.apply_to_config(config)
tabbar.apply_to_config(config)
keymaps.apply_to_config(config)

config.automatically_reload_config      = true
config.quit_when_all_windows_are_closed = true

return config
