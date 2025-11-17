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
		vim.keymap.set("i", "<Tab>", function()
			if ls.jumpable(1) then
				ls.jump(1)
			else
				return "<Tab>"
			end
		end, { silent = true, expr = true })
		vim.keymap.set("i", "<S-Tab>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			else
				return "<S-Tab>"
			end
		end, { silent = true, expr = true })
	end,
}
