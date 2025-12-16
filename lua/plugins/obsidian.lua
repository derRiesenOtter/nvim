return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	event = {
		"BufReadPre /Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/study/*.md",
		"BufNewFile /Users/robin/Library/Mobile Documents/iCloud~md~obsidian/Documents/study/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		callbacks = {
			enter_note = function(note)
				vim.keymap.set("n", "<localleader>on", "<cmd>Obsidian new<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian new note",
				})
				vim.keymap.set("n", "<localleader>ot", "<cmd>Obsidian today<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian today note",
				})
				vim.keymap.set("n", "<localleader>oy", "<cmd>Obsidian yesterday<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian yesterday note",
				})
				vim.keymap.set("n", "<localleader>oT", "<cmd>Obsidian tomorrow<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian tomorrow note",
				})
				vim.keymap.set("n", "<localleader>od", "<cmd>Obsidian dailies<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian dailies picker",
				})
				vim.keymap.set("n", "<localleader>os", "<cmd>Obsidian tags<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian tags picker",
				})
				vim.keymap.set("n", "<localleader>ob", "<cmd>Obsidian backlinks<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian backlinks picker",
				})
				vim.keymap.set("n", "<localleader>op", "<cmd>Obsidian paste_img<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian paste image",
				})
				vim.keymap.set("n", "<localleader>ol", "<cmd>Obsidian links<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian links picker",
				})
				vim.keymap.set("n", "<localleader>oi", "<cmd>Obsidian toc<CR>", {
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
		},
		legacy_commands = false,
		note_id_func = function(title)
			local suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			return suffix
		end,
		checkbox = {
			enabled = true,
			create_new = true,
			order = { " ", "x" },
		},
	},
}
