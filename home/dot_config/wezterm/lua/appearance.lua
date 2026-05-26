-- appearance.lua
-- Handles: colour scheme, font, window chrome, tab bar colours
local wezterm = require('wezterm')
local palette  = require('lua.palette').active
local M        = {}

function M.apply_to_config(config)
  -- Colour scheme
  config.color_scheme = 'Nord (Gogh)'

  -- Window
  config.window_background_opacity    = 0.95
  config.macos_window_background_blur = 20
  config.window_decorations           = 'INTEGRATED_BUTTONS|RESIZE'
  config.window_padding               = { left = 12, right = 12, top = 8, bottom = 8 }

  -- Integrated traffic lights (macOS)
  config.integrated_title_button_style     = 'MacOsNative'
  config.integrated_title_button_alignment = 'Left'
  config.integrated_title_buttons          = { 'Maximize', 'Hide' }

  -- Font
  config.font        = wezterm.font('MesloLGS Nerd Font Mono', { weight = 'Regular' })
  config.font_size   = 16
  config.line_height = 1.2

  -- Tab bar chrome
  config.use_fancy_tab_bar              = false
  config.tab_bar_at_bottom              = false
  config.show_new_tab_button_in_tab_bar = false
  config.show_close_tab_button_in_tabs  = false
  config.tab_max_width                  = 36

  config.colors = {
    tab_bar = {
      background = palette.bg_dim,

      active_tab = {
        bg_color      = palette.bg,
        fg_color      = palette.fg_bright,
        intensity     = 'Normal',
        underline     = 'None',
        italic        = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color  = palette.bg_dim,
        fg_color  = palette.fg_muted,
        intensity = 'Normal',
      },

      inactive_tab_hover = {
        bg_color  = palette.bg_subtle,
        fg_color  = palette.fg_dim,
        italic    = false,
      },
    },
  }
end

return M
