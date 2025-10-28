return {
	"yetone/avante.nvim",
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false,
	opts = {
		instructions_file = "avante.md",
		provider = "code",
		providers = {
			code = {
				__inherited_from = "openai",
				endpoint = "https://ki-chat.uni-mainz.de/api",
				model = "Qwen3 Coder 30B",
				api_key_name = "JGU_API_KEY",
			},
			qwen = {
				__inherited_from = "openai",
				endpoint = "https://ki-chat.uni-mainz.de/api",
				model = "Qwen3 235B Thinking",
				api_key_name = "JGU_API_KEY",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-mini/mini.pick",
		"stevearc/dressing.nvim",
		"folke/snacks.nvim",
		"echasnovski/mini.icons",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
