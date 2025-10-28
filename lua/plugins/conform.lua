return {
	"https://github.com/stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua " },
			r = { "air" },
			markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
			python = { "isort", "black" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
