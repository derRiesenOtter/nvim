return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		completion = {
			menu = {
				auto_show = false,
			},
			list = {
				selection = { preselect = true, auto_insert = false },
			},
		},
		keymap = {
			["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-n>"] = { "show_and_insert", "select_next" },
			["<C-l>"] = { "accept" },
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = { "path", "lsp", "snippets" },
		},
	},
}
