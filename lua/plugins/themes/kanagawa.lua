return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	config = function()
		-- Default options:
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = { bold = false },
			keywordStyle = { bold = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
    theme = {
        all = {
            ui = {
                bg_gutter = "none"
            }
        }
    }
},
		theme = "wave", -- Load "wave" theme when 'background' option is not set
			background = { -- map the value of 'background' option to a theme
				dark = "dragon", -- try "dragon" !
				light = "lotus",
			},
		})

		-- setup must be called before loading
		vim.cmd("colorscheme kanagawa")
    vim.cmd('hi SignColumn guibg=NONE ctermbg=NONE')
    vim.cmd('hi NvimTreeNormal guibg=NONE ctermbg=NONE')

	end,
}
