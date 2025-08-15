require "otter".setup()
require "quarto".setup({
	codeRunner = {
		default_method = "iron" }
})
local runner = require("quarto.runner")
vim.keymap.set("n", "<C-l>", runner.run_cell, { desc = "run cell", silent = true })
vim.keymap.set("n", "<leader>sa", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>sA", runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>sl", runner.run_line, { desc = "run line", silent = true })
vim.keymap.set("v", "<C-l>", runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<leader>p", ':QuartoPreview<CR>')
vim.keymap.set("n", "<C-j>", '/```{<CR>j')
vim.keymap.set("n", "<C-k>", '?```{<CR>nj')
