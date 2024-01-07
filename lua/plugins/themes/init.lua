---@param name string
local load_theme = function(name)
	local themes = {
		rose_pine = require("plugins.themes.rose-pine"),
		catppuccin = require("plugins.themes.catppuccin"),
		gruvbox_base = require("plugins.themes.gruvbox-base"),
		kanagawa = require("plugins.themes.kanagawa"),
	}

	for _, value in pairs(themes) do
		value.enabled = false
	end

	themes[name].enabled = true

	return themes[name]
end

return load_theme("kanagawa")
