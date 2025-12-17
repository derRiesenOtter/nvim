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
vim.opt.conceallevel = 2
vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.spelllang = "en,de"
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

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
vim.keymap.set("n", "<leader>m", ":make")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md", "*.typ" },
	callback = function()
		vim.opt.spell = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "AvanteInput",
	callback = function(event)
		vim.keymap.set("i", "<C-h>", "<Esc><C-w>h", { buffer = event.buf })
		vim.keymap.set("i", "<C-k>", "<Esc><C-w>k", { buffer = event.buf })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	command = "setlocal makeprg=python\\ %",
	vim.keymap.set("n", "<leader>t", ":!pytest %"),
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "R",
	command = "setlocal makeprg=Rscript\\ %",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	command = "setlocal makeprg=clang++\\ -std=c++20\\ -Wall\\ -Wextra\\ -Wpedantic\\ -Wshadow\\ %\\ -o\\ %<\\ &&\\ ./%<",
})

-- automatically import output chunks from a jupyter notebook
-- tries to find a kernel that matches the kernel in the jupyter notebook
-- falls back to a kernel that matches the name of the active venv (if any)
local imb = function(e) -- init molten buffer
	vim.schedule(function()
		local kernels = vim.fn.MoltenAvailableKernels()
		local try_kernel_name = function()
			local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
			return metadata.kernelspec.name
		end
		local ok, kernel_name = pcall(try_kernel_name)
		if not ok or not vim.tbl_contains(kernels, kernel_name) then
			kernel_name = nil
			local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
			if venv ~= nil then
				kernel_name = string.match(venv, "/.+/(.+)")
			end
		end
		if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
			vim.cmd(("MoltenInit %s"):format(kernel_name))
		end
		vim.cmd("MoltenImportOutput")
	end)
end

-- automatically import output chunks from a jupyter notebook
vim.api.nvim_create_autocmd("BufAdd", {
	pattern = { "*.ipynb" },
	callback = imb,
})

-- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.ipynb" },
	callback = function(e)
		if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
			imb(e)
		end
	end,
})

-- automatically export output chunks to a jupyter notebook on write
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.ipynb",
	callback = function()
		if require("molten.status").initialized() == "Molten" then
			vim.schedule(function()
				vim.cmd("MoltenExportOutput!")
			end)
		end
	end,
})

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = { colorscheme = { "gruvbox" } },
	checker = { enabled = false },
	change_detection = {
		enabled = false,
	},
})
