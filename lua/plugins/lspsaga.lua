return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	config = function()
		vim.cmd([[
			hi Normal guibg=NONE ctermbg=NONE
			hi NormalNC guibg=NONE ctermbg=NONE
			hi FloatBorder guibg=NONE ctermbg=NONE
			hi NormalFloat guibg=NONE ctermbg=NONE
		]])
	require("lspsaga").setup({

			finder_action_keys = {
				open = "<CR>"
			},
			definition_action_keys = {
				edit = "<CR>"
			}
		})
	end
}
