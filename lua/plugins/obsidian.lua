return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	event = {
		"BufReadPre /Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/study/*.md",
		"BufNewFile /Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/study/*.md",
		"BufReadPre /Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/private/*.md",
		"BufNewFile /Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/private/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		callbacks = {
			enter_note = function(note)
				vim.keymap.set("n", "<localleader>n", "<cmd>Obsidian new<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian new note",
				})
				vim.keymap.set("n", "<localleader>t", "<cmd>Obsidian today<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian today note",
				})
				vim.keymap.set("n", "<localleader>y", "<cmd>Obsidian yesterday<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian yesterday note",
				})
				vim.keymap.set("n", "<localleader>T", "<cmd>Obsidian tomorrow<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian tomorrow note",
				})
				vim.keymap.set("n", "<localleader>d", "<cmd>Obsidian dailies<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian dailies picker",
				})
				vim.keymap.set("n", "<localleader>s", "<cmd>Obsidian tags<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian tags picker",
				})
				vim.keymap.set("n", "<localleader>b", "<cmd>Obsidian backlinks<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian backlinks picker",
				})
				vim.keymap.set("n", "<localleader>i", "<cmd>Obsidian paste_img<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian paste image",
				})
				vim.keymap.set("n", "<localleader>l", "<cmd>Obsidian links<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian links picker",
				})
				vim.keymap.set("n", "<localleader>h", "<cmd>Obsidian toc<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian toc picker",
				})
			end,
		},
		workspaces = {
			{
				name = "study",
				path = "/Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/study",
			},
			{
				name = "private",
				path = "/Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/private",
			},
		},
		legacy_commands = false,
		daily_notes = {
			folder = "./daily_notes/",
			date_format = "%Y-%m-%d",
			alias_format = nil,
			default_tags = { "daily-notes" },
			workdays_only = false,
		},
		-- note_id_func = function(title)
		-- 	local suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		-- 	return suffix
		-- end,
		checkbox = {
			enabled = true,
			create_new = true,
			order = { " ", "x" },
		},
	},
}
