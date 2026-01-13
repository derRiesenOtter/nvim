return {
	"Vigemus/iron.nvim",
	cmd = { "IronRepl" },
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")
		local common = require("iron.fts.common")
		iron.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "zsh" },
					},
					python = {
						command = { "ipython", "--no-autoindent" },
						format = common.bracketed_paste_python,
						block_dividers = { "# %%", "#%%" },
						env = { PYTHON_BASIC_REPL = "1" },
					},
				},
				repl_filetype = function(bufnr, ft)
					return ft
				end,
				dap_integration = true,
				repl_open_cmd = "vertical botright 60 split",
			},
			keymaps = {
				toggle_repl = "<localleader>r",
				restart_repl = "<localleader>R",
				visual_send = "<localleader>s",
				send_file = "<localleader>A",
				send_line = "<localleader>s",
				send_paragraph = "<localleader>p",
				send_until_cursor = "<localleader>a",
				send_code_block = "<localleader>B",
				send_code_block_and_move = "<localleader>b",
				cr = "<localleader><cr>",
				interrupt = "<localleader><C-c>",
				exit = "<localleader>q",
				clear = "<localleader>c",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})
		-- vim.api.nvim_create_autocmd("BufEnter", {
		-- 	pattern = "*.py",
		-- 	callback = function()
		-- 		iron.setup({
		-- 			keymaps = {
		-- 				toggle_repl = "<localleader>r",
		-- 				restart_repl = "<localleader>R",
		-- 				visual_send = "<localleader>s",
		-- 				send_file = "<localleader>A",
		-- 				send_line = "<localleader>s",
		-- 				send_paragraph = "<localleader>p",
		-- 				send_until_cursor = "<localleader>a",
		-- 				send_code_block = "<localleader>B",
		-- 				send_code_block_and_move = "<localleader>b",
		-- 				cr = "<localleader><cr>",
		-- 				interrupt = "<localleader><C-c>",
		-- 				exit = "<localleader>q",
		-- 				clear = "<localleader>c",
		-- 			},
		-- 		})
		-- 	end,
		-- })
	end,
}
