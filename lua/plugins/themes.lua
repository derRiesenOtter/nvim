return {
	{
		"EdenEast/nightfox.nvim",
	},
	{ "olimorris/onedarkpro.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "ayu-theme/ayu-vim" },
	{ "nanotech/jellybeans.vim" },
	{
		"bluz71/vim-moonfly-colors",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme moonfly]])
		end,
	},
	{ "vague-theme/vague.nvim" },
	{ "jacoborus/tender.vim" },
	{ "kepano/flexoki" },
	{
		"ellisonleao/gruvbox.nvim",
		-- priority = 1000,
		-- config = function()
		-- vim.o.background = "dark"
		-- vim.cmd([[colorscheme gruvbox]])
		-- end,
	},
}
