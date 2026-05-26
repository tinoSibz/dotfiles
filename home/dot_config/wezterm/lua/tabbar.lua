-- tabbar.lua
-- Handles: format-tab-title event, update-right-status event
local wezterm       = require('wezterm')
local palette       = require('lua.palette').active
local M             = {}

-- Process name → nerd font icon
local process_icons = {
	fish   = wezterm.nerdfonts.fa_fish,
	nu     = wezterm.nerdfonts.cod_chevron_right,
	zsh    = wezterm.nerdfonts.dev_terminal,
	nvim   = wezterm.nerdfonts.linux_neovim,
	vim    = wezterm.nerdfonts.custom_vim,
	hx     = wezterm.nerdfonts.md_dna,
	docker = wezterm.nerdfonts.dev_docker,
	claude = wezterm.nerdfonts.md_robot_confused,
	codex  = wezterm.nerdfonts.md_robot_confused,
	gemini = wezterm.nerdfonts.md_robot_confused,
}

-- Editors that set their own pane title (filename/path)
local editors       = { vim = true, nvim = true, hx = true }

-- Shorten a path to at most 3 elements with ~ substitution
-- e.g. ~/Repos/Work/dpsw/src/pipeline.py → …/dpsw/src/pipeline.py
-- e.g. ~/.zshenv → ~/.zshenv
local function short_path(path)
	local home = os.getenv('HOME') or ''
	if home ~= '' then
		path = path:gsub('^' .. home, '~')
	end
	local parts = {}
	for seg in path:gmatch('[^/]+') do
		table.insert(parts, seg)
	end
	if #parts <= 3 then return path end
	return '…/' .. parts[#parts - 2] .. '/' .. parts[#parts - 1] .. '/' .. parts[#parts]
end

-- Resolve the process name from the pane
-- foreground_process_name can miss child processes (e.g. vim launched from zsh)
-- so we fall back to pane title for known editors
local function resolve_name(tab)
	local proc       = tab.active_pane.foreground_process_name
	local pane_title = tab.active_pane.title
	local name       = proc and proc:match('([^/]+)$') or ''

	-- If foreground process is a shell, check pane title for a known editor
	if name == '' or not process_icons[name] then
		local title_name = pane_title:match('^(%S+)')
		if title_name and process_icons[title_name] then
			name = title_name
		end
	end

	return name, pane_title
end

-- Build the tab label
local function tab_title(tab)
	local name, pane_title = resolve_name(tab)
	local icon = process_icons[name] or wezterm.nerdfonts.cod_terminal

	-- For editors, show icon + shortened filepath from pane title
	if editors[name] and pane_title and pane_title ~= '' then
		-- pane title may be "filename — vim" or just a path
		-- strip trailing " — vim/nvim/hx" if present
		local path = pane_title:gsub('%s*[—%-]+%s*%a+$', '')
		path = path:gsub('%s+$', '')
		if path ~= '' then
			return icon .. '  ' .. short_path(path)
		end
	end

	-- For shells and unknown processes, show icon + process name
	return icon .. '  ' .. (name ~= '' and name or '?')
end

function M.apply_to_config(_)
	wezterm.on('format-tab-title', function(tab, _, _, _, _, _)
		local title = tab_title(tab)

		if tab.is_active then
			return {
				{ Background = { Color = palette.bg } },
				{ Foreground = { Color = palette.fg_bright } },
				{ Text = '  ' .. title .. '  ' },
			}
		end

		return {
			{ Background = { Color = palette.bg_dim } },
			{ Foreground = { Color = palette.fg_muted } },
			{ Text = '  ' .. title .. '  ' },
		}
	end)

	-- Right status: workspace name only (SSH indicator added here later)
	wezterm.on('update-right-status', function(window, _)
		local ws = window:active_workspace()
		window:set_right_status(wezterm.format({
			{ Foreground = { Color = palette.accent } },
			{ Text = wezterm.nerdfonts.cod_layers .. '  ' .. ws .. '  ' },
		}))
	end)
end

return M
