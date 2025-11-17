return {
	"nvim-mini/mini.pick",
	version = "*",
	keys = {
		{ "<leader>h", ":Pick help<CR>", desc = "Pick Help" },
		{ "<leader>f", ":Pick files<CR>", desc = "Pick Files" },
		{ "<leader>g", ":Pick grep_live<CR>", desc = "Pick Grep" },
	},
	config = function()
		require("mini.pick").setup()
		vim.ui.select = MiniPick.ui_select
	end,
}
