return {
  "L3MON4D3/luaSnip",
  version =  "v2.*",
  build = "make install_jsregexp",
  dependencies = {"rafamadriz/friendly-snippets"},
  config = function ()
    require('luasnip').filetype_extend("javascript", {"jsdoc"})
  end
}
