return {
	"Vigemus/iron.nvim",
	ft = { "python", "r", "julia" },
	config = function()
		local iron = require("iron.core")
		iron.setup({
			config = {
				repl_definition = {
					julia = {
						command = { "julia", "--project=@." },
					},
					python = {
						command = { "ipython", "--no-autoindent" },
						format = require("iron.fts.common").bracketed_paste,
					},
					r = {
						command = { "R" },
					},
				},
				repl_open_cmd = "vertical botright 80 split",
			},
		})
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.py", "*.r", "*.jl" },
			callback = function()
				iron.setup({
					keymaps = {
						toggle_repl = "<space>ss",
						restart_repl = "<space>sR",
						send_motion = "<space>sm",
						visual_send = "<space>s",
						send_file = "<space>sA",
						send_line = "<space>sl",
						send_paragraph = "<C-s>",
						send_until_cursor = "<space>sa",
						cr = "<space>s<cr>",
						interrupt = "<space>s<space>",
						exit = "<space>sq",
						clear = "<space>sc",
					},
				})
				vim.keymap.set("n", "<C-f>", "}j")
				vim.keymap.set("n", "<C-d>", "{{j")
			end,
		})
	end,
}
