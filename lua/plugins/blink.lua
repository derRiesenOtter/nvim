return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = function(_, opts)
		opts.completion = {
			menu = { auto_show = true },
			list = { selection = { preselect = true, auto_insert = false } },
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
		}
		opts.keymap = {
			["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-n>"] = { "show_and_insert", "select_next" },
			["<C-q>"] = { "cancel" },
			["<C-e>"] = false,
		}
		opts.snippets = { preset = "luasnip" }

		opts.sources = {
			default = { "path", "lsp", "snippets", "buffer" },
			per_filetype = {},
		}

		return opts
	end,
}
