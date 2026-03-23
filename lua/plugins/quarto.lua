return {
	"quarto-dev/quarto-nvim",
	ft = { "quarto", "markdown" },
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("quarto").setup({
			lspFeatures = {
				languages = { "python" },
				chunks = "all",
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = true,
				default_method = "iron",
			},
		})
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.qmd" },
			callback = function()
				local runner = require("quarto.runner")
				vim.keymap.set("n", "<localleader>s", runner.run_cell, { desc = "run cell", silent = true })
				vim.keymap.set("n", "<localleader>a", runner.run_above, { desc = "run cell and above", silent = true })
				vim.keymap.set("n", "<localleader>A", runner.run_all, { desc = "run all cells", silent = true })
				-- vim.keymap.set("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
				vim.keymap.set("v", "<localleader>s", runner.run_range, { desc = "run visual range", silent = true })
				vim.keymap.set("n", "<localleader>p", ":QuartoPreview<CR>")
			end,
		})
	end,
}
