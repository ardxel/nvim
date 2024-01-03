return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	enabled = true,
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = true,
			},
			code_action = {
				show_server_name = true,
			},
			hover = {
				show_server_name = false,
			},
			-- border_follow = true,
			finder_action_keys = {
				open = "<CR>",
			},
			definition_action_keys = {
				edit = "<CR>",
			},
		})
	end,
	keys = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
