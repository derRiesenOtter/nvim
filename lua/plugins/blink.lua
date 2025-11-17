return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = function(_, opts)
		-- list all your Obsidian vault directories
		local vaults = {
			"/Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/study/",
		}

		-- check if current working dir is inside a vault
		local cwd = vim.fn.getcwd()
		local in_vault = false
		for _, vault in ipairs(vaults) do
			if cwd:find(vault, 1, true) == 1 then
				in_vault = true
				break
			end
		end

		-- base opts (you already had this part)
		opts.completion = {
			menu = { auto_show = false },
			list = { selection = { preselect = true, auto_insert = false } },
		}
		opts.keymap = {
			["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-n>"] = { "show_and_insert", "select_next" },
			["<C-l>"] = { "accept" },
		}
		opts.snippets = { preset = "luasnip" }

		opts.sources = {
			default = { "path", "lsp", "snippets" },
			per_filetype = {},
		}

		-- only enable Obsidian source if we’re in a vault
		if in_vault then
			opts.sources.per_filetype.markdown = { "obsidian", "path" }
		else
			opts.sources.per_filetype.markdown = { "path", "lsp" }
		end

		return opts
	end,
}
-- return {
-- 	"saghen/blink.cmp",
-- 	version = "1.*",
-- 	opts = {
-- 		completion = {
-- 			menu = {
-- 				auto_show = false,
-- 			},
-- 			list = {
-- 				selection = { preselect = true, auto_insert = false },
-- 			},
-- 		},
-- 		keymap = {
-- 			["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
-- 			["<C-n>"] = { "show_and_insert", "select_next" },
-- 			["<C-l>"] = { "accept" },
-- 		},
-- 		snippets = { preset = "luasnip" },
-- 		sources = {
-- 			default = { "path", "lsp", "snippets" },
-- 			per_filetype = { markdown = { "obsidian", "path" } },
-- 		},
-- 	},
-- }
