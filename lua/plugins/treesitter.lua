local langs = { "lua", "python", "cpp", "markdown", "markdown_inline", "json", "yaml", "latex" }
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(langs)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = langs,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<c-v>",
					},
					include_surrounding_whitespace = false,
				},
			})
			-- methods
			vim.keymap.set({ "x", "o" }, "am", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "im", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]m", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]M", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[m", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[M", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
			end)

			-- classes
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]c", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]C", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[c", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[C", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
			end)

			-- code blocks
			vim.keymap.set({ "x", "o" }, "ak", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ik", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "<localleader>f", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@code_cell.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "<localleader>F", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@code_cell.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "<localleader>a", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@code_cell.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "<localleader>A", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@code_cell.outer", "textobjects")
			end)

			-- loops
			vim.keymap.set({ "x", "o" }, "ao", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "io", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]o", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@loop.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]O", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[o", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[O", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
			end)
		end,
	},
}
