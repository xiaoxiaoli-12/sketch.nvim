return {
  {
    "Saghen/blink.cmp",
    version = "*",
    dependencies = {
      "saghen/blink.lib",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = {
      keymap = { preset = "default" },
      appearance = { use_nvim_cmp_as_default = true },
      fuzzy = { implementation = "lua" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      snippets = { preset = "luasnip" },
      signature = { enabled = true },
    },
  },
}
