return {
	"chomosuke/typst-preview.nvim",
	lazy = false,
	version = "1.*",
	config = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.typ" },
			callback = function()
				vim.keymap.set("n", "<localleader>p", ":TypstPreview<CR>")
			end,
		})
	end,
}
