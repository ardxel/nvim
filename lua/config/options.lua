local opt = vim.opt

vim.o.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smarttab = true
opt.autoindent = true
opt.completeopt = "menuone,noinsert,noselect"

opt.ignorecase = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.pumheight = 10
opt.hidden = true
opt.scrolloff = 10
opt.swapfile = false
opt.modifiable = true
opt.pumblend = 10
opt.termguicolors = true

vim.api.nvim_exec(
	[[
  augroup IndentSettings
    autocmd!
    " Отключаем автоматическое форматирование отступов для Python
    autocmd FileType python lua vim.opt_local.expandtab = true
    " Если используете Stylua для Lua, то аналогично для Lua
    autocmd FileType lua lua vim.opt_local.expandtab = true
    " Для JavaScript убедитесь, что Prettier настроен корректно и не использует Vim-стиль отступов
    autocmd FileType javascript lua vim.opt_local.expandtab = true
  augroup END
]],
	false
)

