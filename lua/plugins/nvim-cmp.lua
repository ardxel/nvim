local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert"
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			duplicates = {
				nvim_lsp = 1,
				luasnip = 1,
				buffer = 1,
				path = 1,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<Esc>"] = cmp.mapping.confirm({ select = false }),
				["<Enter>"] = cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Replace,
				}),
				["qq"] = cmp.mapping.close(),
				["<C-l>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "buffer", priority = 500 },
				{ name = "path", priority = 250 },
				{ name = "emoji", priority = 800 },
				{ name = "luasnip" },
			}),
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entity, item)
					item.menu = ({
						nvim_lsp = "[LSP]  ",
						luasnip = "[Snip]  ",
						buffer = "[Buff]  ",
						path = "[Path]  ",
					})[entity.source.name]

					if kind_icons[item.kind] then
						item.kind = kind_icons[item.kind] .. item.kind 
					end
					
					return item
				end,
			},
		})
	end,
	dependencies = {
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
		},
	},
}
