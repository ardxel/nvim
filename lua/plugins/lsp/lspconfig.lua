---@diagnostic disable: missing-fields

local setupSignIcons = function()
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
end

local config = function()
  setupSignIcons()
	require("neoconf").setup({})
	local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local attach = require("plugins.lsp.utils.attach")

	lspconfig.tsserver.setup({
		on_attach = attach,
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

	lspconfig.emmet_language_server.setup({
		filetypes = {
			"css",
			"html",
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
			"sass",
			"scss",
		},
		-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
		-- **Note:** only the options listed in the table are supported.
		init_options = {
			--- @type string[]
			excludeLanguages = {},
			--- @type string[]
			extensionsPath = {},
			--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
			preferences = {},
			--- @type boolean Defaults to `true`
			showAbbreviationSuggestions = true,
			--- @type "always" | "never" Defaults to `"always"`
			showExpandedAbbreviation = "always",
			--- @type boolean Defaults to `false`
			showSuggestionsAsSnippets = false,
			--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
			syntaxProfiles = {},
			--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
			variables = {},
		},
	})

	lspconfig.tailwindcss.setup({
		on_attach = attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
		exclude = { "*.ts" },
		filetypes = {
			"html",
			"css",
			"scss",
			"javascript",
			"javascriptreact",
			"typescriptreact",
		},
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
		on_attach = attach,
		filetypes = {
			"sh",
			"aliasrc",
		},
	})

	lspconfig.dockerls.setup({
		capabilities = capabilities,
		on_attach = attach,
	})

	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = attach,
		filetypes = { "json", "jsonc" },
		settings = {
			json = {
				schemas = require("plugins.lsp.utils.json-schemas"),
			},
		},
	})
  
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	opts = {
		-- options for vim.diagnostic.config()
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
			severity_sort = true,
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
		},
	},
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
		"windwp/nvim-autopairs",
	},
}
