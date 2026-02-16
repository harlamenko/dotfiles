local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Kanagawa (Gogh)"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.hide_mouse_cursor_when_typing = false

config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono Nerd Font Mono",
		weight = "Regular",
	},
})
config.font_size = 10.0

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

-- бесшовное перемещение между сплитами nvim и wezterm через Ctrl+hjkl
local function is_nvim(pane)
	local process_name = pane:get_foreground_process_name()
	if process_name then
		return process_name:find("n?vim") ~= nil
	end
	return pane:get_user_vars().IS_NVIM == "true"
end

---@param resize_or_move "resize" | "move"
---@param mods string
---@param key string
---@param dir "Right" | "Left" | "Up" | "Down"
local function split_nav(resize_or_move, mods, key, dir)
	local event = "SplitNav_" .. resize_or_move .. "_" .. dir
	wezterm.on(event, function(win, pane)
		if is_nvim(pane) then
			-- pass the keys through to vim/nvim
			win:perform_action({ SendKey = { key = key, mods = mods } }, pane)
		else
			if resize_or_move == "resize" then
				win:perform_action({ AdjustPaneSize = { dir, 3 } }, pane)
			else
				local panes = pane:tab():panes_with_info()
				local is_zoomed = false
				for _, p in ipairs(panes) do
					if p.is_zoomed then
						is_zoomed = true
					end
				end
				wezterm.log_info("is_zoomed: " .. tostring(is_zoomed))
				if is_zoomed then
					dir = dir == "Up" or dir == "Right" and "Next" or "Prev"
					wezterm.log_info("dir: " .. dir)
				end
				win:perform_action({ ActivatePaneDirection = dir }, pane)
				win:perform_action({ SetPaneZoomState = is_zoomed }, pane)
			end
		end
	end)
	return {
		key = key,
		mods = mods,
		action = wezterm.action.EmitEvent(event),
	}
end

config.keys = {
	{ mods = "ALT|SHIFT", key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "ALT", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	{ mods = "ALT", key = "Enter", action = act.SpawnTab("CurrentPaneDomain") },

	{ mods = "ALT", key = "w", action = act.CloseCurrentPane({ confirm = true }) },
	{ mods = "ALT", key = "t", action = act.CloseCurrentTab({ confirm = true }) },

	split_nav("resize", "CTRL", "LeftArrow", "Left"),
	split_nav("resize", "CTRL", "RightArrow", "Right"),
	split_nav("resize", "CTRL", "UpArrow", "Up"),
	split_nav("resize", "CTRL", "DownArrow", "Down"),
	split_nav("move", "CTRL", "h", "Left"),
	split_nav("move", "CTRL", "j", "Down"),
	split_nav("move", "CTRL", "k", "Up"),
	split_nav("move", "CTRL", "l", "Right"),

	{ mods = "LEADER", key = "z", action = act.TogglePaneZoomState },

	{ mods = "ALT", key = "1", action = act.ActivateTab(0) },
	{ mods = "ALT", key = "2", action = act.ActivateTab(1) },
	{ mods = "ALT", key = "3", action = act.ActivateTab(2) },
	{ mods = "ALT", key = "4", action = act.ActivateTab(3) },
	{ mods = "ALT", key = "5", action = act.ActivateTab(4) },
	{ mods = "ALT", key = "6", action = act.ActivateTab(5) },
	{ mods = "ALT", key = "7", action = act.ActivateTab(6) },
	{ mods = "ALT", key = "8", action = act.ActivateTab(7) },
	{ mods = "ALT", key = "9", action = act.ActivateTab(8) },

	{ mods = "ALT", key = "/", action = act.Search({ CaseSensitiveString = "" }) },
	{ mods = "ALT", key = "?", action = act.Search({ CaseSensitiveString = "" }) },
}

return config
