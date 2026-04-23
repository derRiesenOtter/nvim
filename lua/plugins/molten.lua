return {
	"benlubas/molten-nvim",
	version = "c1db39e78fe18559d8f2204bf5c4d476bdc80d3e",
	build = ":UpdateRemotePlugins",
	init = function()
		vim.g.molten_output_virt_lines = true
		vim.g.molten_virt_text_output = true
		vim.g.molten_virt_lines_off_by_1 = true
		vim.g.molten_cover_empty_lines = true
		vim.g.molten_auto_open_output = false
		vim.g.molten_image_provider = "snacks.nvim"
		vim.g.molten_output_win_max_height = 20

		vim.keymap.set(
			"n",
			"<localleader>o",
			":noautocmd MoltenEnterOutput<CR>",
			{ desc = "open output window", silent = true }
		)
		vim.keymap.set("n", "<localleader>d", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

		vim.keymap.set("n", "<localleader>s", function()
			vim.cmd("MoltenEvaluateOperator")
			vim.schedule(function()
				local ik = vim.api.nvim_replace_termcodes("is", true, true, true)
				vim.api.nvim_feedkeys(ik, "m", false)
			end)
		end)

		local default_python_notebook = [[
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
				file:write(default_python_notebook)
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
}
