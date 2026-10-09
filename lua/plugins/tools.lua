return {
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle outline" },
    },
    opts = {},
  },
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    cmd = {
      "CMakeGenerate",
      "CMakeBuild",
      "CMakeRun",
      "CMakeDebug",
      "CMakeSelectBuildTarget",
      "CMakeSelectLaunchTarget",
    },
    keys = {
      { "<leader>mg", "<cmd>CMakeGenerate<cr>", desc = "CMake generate" },
      { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "CMake build" },
      { "<leader>mr", "<cmd>CMakeRun<cr>", desc = "CMake run" },
      { "<leader>md", "<cmd>CMakeDebug<cr>", desc = "CMake debug" },
      { "<leader>mt", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake select build target" },
      { "<leader>ml", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "CMake select launch target" },
    },
    opts = {},
  },
}
