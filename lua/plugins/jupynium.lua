return {
	"kiyoon/jupynium.nvim",
	build = "pip install --user .",
	ft = { "python", "r", "julia" },
	opts = {
		python_host = { "pyenv", "exec", "python" },
		auto_start_server = {
			enable = true,
			file_pattern = { "*.ju.*" },
		},
		auto_attach_to_server = {
			enable = true,
			file_pattern = { "*.ju.*", "*.md" },
		},
		auto_download_ipynb = false,
		use_default_keybindings = false,
	},
	keys = {
		{ "<localleader>s", "<cmd>JupyniumExecuteSelectedCells<CR>", desc = "Execute Cell" },
		{ "<localleader>c", "<cmd>JupyniumClearSelectedCellsOutputs<CR>", desc = "Clear Cell" },
		{
			"<localleader>a",
			function()
				local name = vim.fn.expand("%")
				name = name:sub(1, -7)
				vim.cmd("JupyniumStartSync " .. name)
			end,
			desc = "Sync Jupynium (new)",
		},
		{ "<localleader>A", "<cmd>JupyniumStartSync 2<CR>", desc = "Sync Jupynium (existing)" },
	},
}
