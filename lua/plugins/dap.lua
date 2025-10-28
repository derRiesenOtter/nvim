return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>b", function()
				require("dap").toggle_breakpoint()
			end)
			vim.keymap.set("n", "<leader>d", function()
				require("dap").continue()
			end)
			vim.keymap.set("n", "<down>", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<right>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<up>", function()
				require("dap").step_out()
			end)
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		end,
	},
}
