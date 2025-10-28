return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	opts = {
		enable_autosnippets = true,
	},
	config = function()
		local ls = require("luasnip")
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
		vim.keymap.set("i", "<C-e>", function()
			ls.expand()
		end, { desc = "Expand Snippet" })
		vim.keymap.set("i", "<C-l>", function()
			require("luasnip").jump(1)
		end, { silent = true })
		vim.keymap.set("i", "<C-h>", function()
			require("luasnip").jump(-1)
		end, { silent = true })
	end,
}
