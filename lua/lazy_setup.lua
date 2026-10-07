require("lazy").setup({
  { import = "plugins" },
}, {
  install = { colorscheme = { "vscode", "habamax" } },
  ui = { backdrop = 100 },
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "tutor",
        "rplugin",
      },
    },
  },
})
