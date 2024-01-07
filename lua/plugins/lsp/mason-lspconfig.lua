return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	opts = {
		ensure_installed = {
			"lua_ls",
			"bashls",
			"tsserver",
			"tailwindcss",
	  	"jsonls",
			-- "emmet-language-server",
			-- "dockerfile-language-server",
			-- "luacheck",
			-- "stylua",
			-- "eslint",
			-- "prettier_d",
			-- "shellchech",
			-- "shfmt",
			-- "fixjson",
			-- "hadolint"
		},
		automatic_installation = true
	},
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim"
}

