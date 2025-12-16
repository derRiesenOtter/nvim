return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil Explorer" })
	end,
}
