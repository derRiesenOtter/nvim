return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.lib",
		"rafamadriz/friendly-snippets",
	},
	build = function()
		require("blink.cmp").build():wait(60000)
	end,

	opts = {

		completion = { documentation = { auto_show = true } },

		sources = { default = { "lsp", "path", "snippets", "buffer" } },

		fuzzy = { implementation = "rust" },
	},
}
