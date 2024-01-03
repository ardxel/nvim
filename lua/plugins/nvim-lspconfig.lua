---@diagnostic disable: missing-fields
local on_attach = function(client, bufnr)
	local keymap = vim.keymap
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<C-m>k", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "<C-m>j", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
end

local config = function()
	require("neoconf").setup({})

	local signs = {
		Error = " ",
		Warn = " ",
		Hint = "",
		Info = "",
	}

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
	end

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lspconfig = require("lspconfig")

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier_d = require("efmls-configs.formatters.prettier_d")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
		filetypes = {
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	lspconfig.lua_ls.setup({
		diagnostics = {
			Lua = {
				globals = { "vim" },
			},
		},
	})

	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"sh",
			"aliasrc",
		},
	})

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"json",
			"sh",
			"markdown",
			"docker",
			"html",
			"css",
			"scss",
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				html = { prettier_d },
				css = { prettier_d },
				scss = { prettier_d },
				sh = { shellcheck, shfmt },
			},
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
