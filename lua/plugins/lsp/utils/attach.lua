local attach = function(client, bufnr)
	local keymap = vim.keymap
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
	keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
end

return attach
