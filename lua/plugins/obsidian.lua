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
				vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian new note",
				})
				vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian today<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian today note",
				})
				vim.keymap.set("n", "<leader>oy", "<cmd>Obsidian yesterday<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian yesterday note",
				})
				vim.keymap.set("n", "<leader>oT", "<cmd>Obsidian tomorrow<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian tomorrow note",
				})
				vim.keymap.set("n", "<leader>od", "<cmd>Obsidian dailies<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian dailies picker",
				})
				vim.keymap.set("n", "<leader>os", "<cmd>Obsidian tags<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian tags picker",
				})
				vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian backlinks picker",
				})
				vim.keymap.set("n", "<leader>op", "<cmd>Obsidian paste_img<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian paste image",
				})
				vim.keymap.set("n", "<leader>ol", "<cmd>Obsidian links<CR>", {
					buffer = note.bufnr,
					desc = "Obsidian links picker",
				})
				vim.keymap.set("n", "<leader>oi", "<cmd>Obsidian toc<CR>", {
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
