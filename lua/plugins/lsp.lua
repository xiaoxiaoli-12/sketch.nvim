return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "clangd", "lua_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "Saghen/blink.cmp" },
    config = function()
      -- Configure servers before mason-lspconfig enables them (Neovim 0.11+).
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
      vim.lsp.config("clangd", {
        capabilities = { offsetEncoding = { "utf-16" } },
        cmd = {
          "clangd",
          "--background-index",
          "--background-index-priority=background",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=never",
          "--pch-storage=memory",
          "-j=4",
        },
      })

      local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
      -- format on save (only if LSP supports formatting)
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        callback = function(args)
          if #vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" }) > 0 then
            vim.lsp.buf.format({ async = false, bufnr = args.buf })
          end
        end,
      })

      -- LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(args)
          local bufnr = args.buf
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
          end
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          map("gd", vim.lsp.buf.definition, "Goto definition")
          map("K", vim.lsp.buf.hover, "Hover")
          map("gi", vim.lsp.buf.implementation, "Goto implementation")
          map("<leader>k", vim.lsp.buf.signature_help, "Signature help")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
        end,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "tree-sitter-cli" },
    },
  },
}
