-- return {
-- 	"sainnhe/gruvbox-material",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.gruvbox_material_transparent_background = 1
-- 		vim.g.gruvbox_material_dim_inactive_windows = 1
-- 		vim.g.gruvbox_material_foreground = "material"
-- 		vim.g.gruvbox_material_better_performance = 1
-- 		vim.cmd([[hi! NormalFloat guibg=NONE ctermbg=NONE]])
-- 		vim.cmd([[hi hl-Pmenu guibg=NONE ctermbg=NONE]])
--
-- 		-- set transparent sign signcolumn
-- 		vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
-- 		-- set transparent background
-- 		vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
-- 		-- setup gruvbox theme
-- 		vim.cmd("colorscheme gruvbox-material")
--
-- 		-- vim.o.background = "dark"
-- 	end,
-- }

return {
	"rose-pine/neovim",
	lazy = false,
	config = function()
		vim.cmd([[hi! NormalFloat guibg=NONE ctermbg=NONE]])
		vim.cmd([[hi hl-Pmenu guibg=NONE ctermbg=NONE]])

		-- set transparent sign signcolumn
		vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
		-- set transparent background
		vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")

		require("rose-pine").setup({
			variant = "main",
			dim_nc_background = true,
			disable_background = true,
			disable_float_background = true,
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
