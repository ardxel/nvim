local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.globals")
require("config.keymaps")
require("config.autocmds")

local plugins = "plugins"

local options = {
	default = { lazy = true },
	rtp = {
		disabled_plugins = {
			"gzip",
		"matchit",
		"netrwPlugin",
		"tarPlugin",
		"tohtml",
		},
	},
}

require("lazy").setup(plugins, options)
