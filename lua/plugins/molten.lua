return {
	{
		"benlubas/molten-nvim",
		commit = "4fd7be6a12b5efda5179db642f13bad60893acca",
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		config = function()
			vim.keymap.set("n", "<leader>ji", function()
				local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
				if venv ~= nil then
					venv = string.match(venv, "/.+/(.+)")
					vim.cmd(("MoltenInit %s"):format(venv))
				else
					vim.cmd("MoltenInit python3")
				end
			end, { desc = "Initialize Molten for python3", silent = true })
		end,
		init = function()
			vim.g.molten_output_virt_lines = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true
			vim.g.molten_cover_empty_lines = true
			vim.g.molten_image_location = "virt"
			vim.g.molten_auto_open_output = false
			vim.g.molten_auto_image_popup = false
			vim.g.molten_auto_open_html_in_browser = false
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.keymap.set(
				"n",
				"<localleader>ko",
				":noautocmd MoltenEnterOutput<CR>",
				{ desc = "open output window", silent = true }
			)
			vim.keymap.set(
				"n",
				"<localleader>kh",
				":MoltenHideOutput<CR>",
				{ desc = "close output window", silent = true }
			)
			vim.keymap.set("n", "<localleader>kd", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

			vim.keymap.set("n", "<localleader>kk", function()
				vim.cmd("MoltenEvaluateOperator")
				vim.schedule(function()
					local ik = vim.api.nvim_replace_termcodes("ik", true, true, true)
					vim.api.nvim_feedkeys(ik, "m", false)
				end)
			end)

			local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

			local function new_notebook(filename)
				local path = filename .. ".ipynb"
				local file = io.open(path, "w")
				if file then
					file:write(default_notebook)
					file:close()
					vim.cmd("edit " .. path)
				else
					print("Error: Could not open new notebook file for writing.")
				end
			end

			vim.api.nvim_create_user_command("NewNotebook", function(opts)
				new_notebook(opts.args)
			end, {
				nargs = 1,
				complete = "file",
			})
		end,
	},
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
