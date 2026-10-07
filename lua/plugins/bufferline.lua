return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "echasnovski/mini.icons" },
    event = "VeryLazy",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", text_align = "left" },
        },
      },
    },
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
      { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers right" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
  },
  {
    "famiu/bufdelete.nvim",
    keys = {
      { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Close buffer" },
    },
  },
}
