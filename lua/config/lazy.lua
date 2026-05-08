local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.showtabline = 0
-- vim.opt.conceallevel = 2
vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.spelllang = "en,de"
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	severity_sort = true,
})

vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("n", "<localleader>i", ":IronRepl<CR>")

vim.keymap.set("n", "<leader>c", function()
	vim.opt.number = not vim.opt.number:get()
	vim.opt.relativenumber = vim.opt.number:get()
	if vim.opt.signcolumn:get() == "no" then
		vim.opt.signcolumn = "yes"
	else
		vim.opt.signcolumn = "no"
	end
	local vt = vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = not vt })
end, { desc = "Toggle UI clutter" })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md", "*.typ" },
	callback = function()
		vim.opt.spell = true
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	pattern = "*.typ",
	callback = function(args)
		local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":t")
		if fname ~= "main.typ" then
			return
		end

		vim.defer_fn(function()
			vim.cmd("LspTinymistPinMain")
		end, 200)
	end,
})

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = false },
	change_detection = {
		enabled = false,
	},
})
