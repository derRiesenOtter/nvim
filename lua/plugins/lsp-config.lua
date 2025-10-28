return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 's', 'i', 't', 'MiniPick' }
          }
        }
      }
    })
  end,
}
