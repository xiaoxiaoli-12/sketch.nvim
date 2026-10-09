return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        enabled = true,
        layouts = {
          default = {
            layout = {
              backdrop = false,
              width = 0.8,
              min_width = 120,
              height = 0.75,
              min_height = 30,
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom", ft = "snacks_picker_input" },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview:Preview}", height = 0.45, border = "top" },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
      { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
      { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
      { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols" },
      { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "gr", function() Snacks.picker.lsp_references() end, desc = "References", nowait = true },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git log file" },
    },
  },
}
