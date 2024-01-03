return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local theme = require("lualine.themes.nord")

		require("lualine").setup({
			options = {
				theme = theme,
				globalstatus = true,
			},
		})
	end,
}
