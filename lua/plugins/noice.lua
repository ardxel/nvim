return {
	"folke/noice.nvim",
	event = "VeryLazy",
  config = function()
		require('noice').setup({
			routes = {
				{
					filter = {
						event = 'notify',
						find = "No information available"
					},
					opts = {skip = true}
				},
				{
					filter = {
						event = "notify",
						find = "No code actions available"
					},
					opts = {skip = true}
				}
			}
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				local notify = require('notify')
				notify.setup({
					background_colour = "#000000",
				})

				vim.keymap.set("n", "<leader>sx", notify.dismiss, {noremap = true})
			end,
		},
	},
}
