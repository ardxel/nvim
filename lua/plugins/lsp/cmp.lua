return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
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
				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),
				["<Enter>"] = cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Replace,
				}),
				["<Esc>"] = cmp.mapping.close(),
				["<C-l>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
        { name = "luasnip", priority = 1100 },
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "buffer", priority = 500 },
				{ name = "path", priority = 250 },
			}),
			formatting = {
				fields = { "abbr", "menu", "kind" },
				format = function(entity, item)
					item.menu = ({
						nvim_lsp = "[LSP] ",
						luasnip = "[Snip] ",
						buffer = "[Buff] ",
						path = "[Path] ",
					})[entity.source.name]

					local kind_icons = require("config.icons.kinds")

					if kind_icons[item.kind] then
						item.kind = kind_icons[item.kind] .. item.kind
					end

					return item
				end,
			},
		})
	end,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
}
