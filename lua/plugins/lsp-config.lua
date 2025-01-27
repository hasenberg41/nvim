return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
        -- ensure_installed = { "lua_ls", "ruby_lsp", "rubocop" },
        -- ensure_installed = { "lua_ls", "solargraph", "rubocop" }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
      })
      -- lspconfig.solargraph.setup({})
      lspconfig.rubocop.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

      -- Jump to the definition
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

      -- Jump to declaration
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})

      -- Lists all the implementations for the symbol under the cursor
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})

      -- Jumps to the definition of the type symbol
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {})

      -- Lists all the references
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

      -- Displays a function's signature information
      -- vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, {})

      -- Renames all references to the symbol under the cursor
      -- vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {})

      -- Selects a code action available at the current cursor position
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, {})

      -- Show diagnostics in a floating window
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})

      -- Move to the previous diagnostic
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})

      -- Move to the next diagnostic
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
    end,
  },
}
