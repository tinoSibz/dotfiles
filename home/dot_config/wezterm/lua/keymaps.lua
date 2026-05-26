-- keymaps.lua
-- Handles: key bindings, key tables, and launch menu (shell/app picker)
-- Philosophy: preserve WezTerm defaults, only override what is needed.
local wezterm     = require('wezterm')
local M           = {}

-- Shell and app launcher entries.
-- Add new shells, editors, or tools here as needed.
local launch_menu = {
	{
		label = '  zsh',
		args  = { '/opt/homebrew/bin/zsh', '-l' },
	},
	{
		label = '  nu',
		args  = { '/opt/homebrew/bin/nu' },
	},
	{
		label = '  fish',
		args  = { '/opt/homebrew/bin/fish' },
	},
}

function M.apply_to_config(config)
	config.default_prog = { '/opt/homebrew/bin/fish' }
	config.launch_menu = launch_menu

	-- Leader: CTRL+A (tmux-style), 1 second timeout
	config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

	config.keys = {
		---------------------------------------------------------------------------
		-- Leader passthrough: CTRL+A CTRL+A → send CTRL+A to the terminal
		---------------------------------------------------------------------------
		{
			key    = 'a',
			mods   = 'LEADER|CTRL',
			action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
		},

		---------------------------------------------------------------------------
		-- Tabs: override CMD+T to open shell picker instead of default shell
		---------------------------------------------------------------------------
		{
			key    = 't',
			mods   = 'SUPER',
			action = wezterm.action.ShowLauncher,
		},

		---------------------------------------------------------------------------
		-- Panes: navigation (i3-style, CMD + arrow)
		---------------------------------------------------------------------------
		{
			key    = 'LeftArrow',
			mods   = 'SUPER',
			action = wezterm.action.ActivatePaneDirection('Left'),
		},
		{
			key    = 'RightArrow',
			mods   = 'SUPER',
			action = wezterm.action.ActivatePaneDirection('Right'),
		},
		{
			key    = 'UpArrow',
			mods   = 'SUPER',
			action = wezterm.action.ActivatePaneDirection('Up'),
		},
		{
			key    = 'DownArrow',
			mods   = 'SUPER',
			action = wezterm.action.ActivatePaneDirection('Down'),
		},

		---------------------------------------------------------------------------
		-- Panes: splits (i3-style, CMD+SHIFT + arrow → split in that direction)
		---------------------------------------------------------------------------
		{
			key    = 'LeftArrow',
			mods   = 'SUPER|SHIFT',
			action = wezterm.action.SplitPane { direction = 'Left' },
		},
		{
			key    = 'RightArrow',
			mods   = 'SUPER|SHIFT',
			action = wezterm.action.SplitPane { direction = 'Right' },
		},
		{
			key    = 'UpArrow',
			mods   = 'SUPER|SHIFT',
			action = wezterm.action.SplitPane { direction = 'Up' },
		},
		{
			key    = 'DownArrow',
			mods   = 'SUPER|SHIFT',
			action = wezterm.action.SplitPane { direction = 'Down' },
		},

		---------------------------------------------------------------------------
		-- Panes: resize (CMD+CTRL + arrow)
		---------------------------------------------------------------------------
		{
			key    = 'LeftArrow',
			mods   = 'SUPER|CTRL',
			action = wezterm.action.AdjustPaneSize { 'Left', 3 },
		},
		{
			key    = 'RightArrow',
			mods   = 'SUPER|CTRL',
			action = wezterm.action.AdjustPaneSize { 'Right', 3 },
		},
		{
			key    = 'UpArrow',
			mods   = 'SUPER|CTRL',
			action = wezterm.action.AdjustPaneSize { 'Up', 3 },
		},
		{
			key    = 'DownArrow',
			mods   = 'SUPER|CTRL',
			action = wezterm.action.AdjustPaneSize { 'Down', 3 },
		},

		---------------------------------------------------------------------------
		-- Panes: zoom and close
		---------------------------------------------------------------------------
		{
			key    = 'z',
			mods   = 'LEADER',
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			key    = 'x',
			mods   = 'LEADER',
			action = wezterm.action.CloseCurrentPane { confirm = true },
		},

		---------------------------------------------------------------------------
		-- Workspaces
		---------------------------------------------------------------------------
		-- {
		--   key    = 'w',
		--   mods   = 'LEADER',
		--   action = projects.choose_project(),
		-- },
		{
			key    = 'f',
			mods   = 'LEADER',
			action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
		},
	}
end

return M
