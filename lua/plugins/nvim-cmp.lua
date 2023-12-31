return {
	{"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<Esc>"] = cmp.mapping.confirm({ select = false }),
				["<Enter>"] = cmp.mapping.confirm({ select = true }),
				["qq"] = cmp.mapping.close(),
				["<C-l>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "emoji" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxWidth = 70,
				}),
			},
		})
	end,
	dependencies = {
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
		},
	}},
	{
  "amrbashir/nvim-docs-view",
  lazy = true,
  cmd = "DocsViewToggle",
  opts = {
    position = "right",
    width = 60
  }
}
}
