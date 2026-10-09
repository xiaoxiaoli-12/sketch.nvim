return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})
      ts.install({ "lua", "vim", "c", "cpp", "cmake", "markdown" })

      local function attach(bufnr, lang)
        if not vim.api.nvim_buf_is_valid(bufnr) then return end
        if vim.treesitter.language.get_lang(vim.bo[bufnr].filetype) ~= lang then return end
        pcall(vim.treesitter.start, bufnr, lang)
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then return end
          if pcall(vim.treesitter.language.add, lang) then
            attach(args.buf, lang)
          elseif vim.tbl_contains(ts.get_available(), lang) then
            ts.install({ lang }):await(vim.schedule_wrap(function()
              attach(args.buf, lang)
            end))
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      select = { lookahead = true },
      move = { set_jumps = true },
    },
    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)
      local select = require("nvim-treesitter-textobjects.select")
      for keys, query in pairs({
        af = "@function.outer", ["if"] = "@function.inner",
        ac = "@class.outer", ic = "@class.inner",
        aP = "@parameter.outer", iP = "@parameter.inner",
      }) do
        vim.keymap.set({ "x", "o" }, keys, function()
          select.select_textobject(query, "textobjects")
        end, { desc = "Select " .. query })
      end

      local move = require("nvim-treesitter-textobjects.move")
      for method, mappings in pairs({
        goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
        goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
        goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
        goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
      }) do
        for keys, query in pairs(mappings) do
          vim.keymap.set({ "n", "x", "o" }, keys, function()
            move[method](query, "textobjects")
          end, { desc = method .. " " .. query })
        end
      end
    end,
  },
  { "windwp/nvim-autopairs", opts = {} },
  { "echasnovski/mini.icons", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  { "kylechui/nvim-surround", opts = {} },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = { [[<C-/>]], [[<C-_>]] },
      direction = "float",
      float_opts = { border = "rounded" },
    },
    keys = {
      { "<C-/>", desc = "Toggle terminal" },
      { "<C-_>", desc = "Toggle terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal float" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
    },
    keys = {
      { "<leader>", mode = { "n", "v" } },
    },
  },
}
