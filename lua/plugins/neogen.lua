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

		vim.keymap.set("n", "<leader>ngd", function()
			neogen.generate()
		end, opts)

    vim.keymap.set("n", "<leader>ngf", function ()
      neogen.generate({type = "func"})
    end)
	end,
}
