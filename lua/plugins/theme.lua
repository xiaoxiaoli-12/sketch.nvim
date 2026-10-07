local colors = {
  comments = "#57a64a",
  functions = "#ff8000",
  keywords = "#569cd6",
  numbers = "#b5cea8",
  strings = "#d69d85",
  namespace = "#b8d7a3",
  preprocessor = "#bd63c5",
  enum_member = "#b9771e",
  control = "#d8a0df",
  types = "#ffd700",
  variables = "#bdb76b",
}

local function highlight(color, groups)
  for _, group in ipairs(groups) do
    local existing = vim.api.nvim_get_hl(0, { name = group, link = false })
    vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", existing, { fg = colors[color] }))
  end
end

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "dark" },
    config = function(_, opts)
      require("vscode").setup(opts)
      vim.cmd.colorscheme("vscode")
      highlight("comments", { "@comment", "@comment.documentation", "@lsp.type.comment", "@lsp.type.comment.c", "@lsp.type.comment.cpp" })
      highlight("functions", { "@function", "@function.call", "@function.method", "@function.method.call", "@lsp.type.function", "@lsp.type.method", "@lsp.type.member" })
      highlight("keywords", { "@keyword", "@lsp.type.keyword" })
      highlight("numbers", { "@number", "@number.float", "@lsp.type.number" })
      highlight("strings", { "@string", "@string.regexp", "@character", "@lsp.type.string" })
      highlight("namespace", { "@module", "@lsp.type.namespace" })
      highlight("preprocessor", { "@constant.macro", "@function.macro", "@keyword.directive", "@keyword.directive.define", "@lsp.type.macro" })
      highlight("enum_member", { "@lsp.type.enumMember" })
      highlight("control", { "@keyword.conditional", "@keyword.repeat", "@keyword.return", "@lsp.mod.controlFlow", "@lsp.typemod.keyword.controlFlow" })
      highlight("types", { "@type", "@type.builtin", "@type.definition", "@lsp.type.type", "@lsp.type.class", "@lsp.type.struct", "@lsp.type.interface", "@lsp.type.enum", "@lsp.type.typeParameter", "@lsp.typemod.type.defaultLibrary" })
      highlight("variables", { "@variable", "@variable.parameter", "@variable.member", "@property", "@lsp.type.variable", "@lsp.type.parameter", "@lsp.type.property", "@lsp.typemod.variable.readonly", "@lsp.typemod.property.readonly", "@lsp.typemod.variable.constant" })
    end,
  },
}
