return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		local neogen = require("neogen")
		local opts = { noremap = true, silent = true }

		neogen.setup({
			enabled = true,
			input_after_comment = true,
		})

		vim.keymap.set("n", "<leader>nf", function()
			neogen.generate()
		end, opts)
	end,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
