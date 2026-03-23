return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "s", "i", "t", "Snacks" },
					},
				},
			},
		})
		vim.lsp.config("tinymist", {
			root_markers = { "main.typ" },
		})
	end,
}
