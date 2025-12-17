return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>gg", ":G<CR>" },
		{ "<leader>ga", ":G add .<CR>" },
		{ "<leader>gc", ":G commit <CR>" },
		{ "<leader>gp", ":G push<CR>" },
		{ "<leader>gP", ":G pull --rebase<CR>" },
		{ "<leader>gw", ":Gwrite<CR>" },
		{ "<leader>gr", ":Gread<CR>" },
		{ "<leader>gs", ":G switch " },
		{ "<leader>gd", ":Gdiff<CR>" },
		{ "<leader>gh", ":G add --patch<CR>" },
		{ "<leader>gb", ":Git blame<CR>" },
	},
}
