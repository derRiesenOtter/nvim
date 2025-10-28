return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre /Users/robin/obsidian_vault/*.md",
    "BufNewFile /Users/robin/obsidian_vault/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/robin/obsidian_vault/"
      },
    },
    mappings = {
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },
    ui = {
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      }
    },
    follow_url_func = function(url)
      vim.ui.open(url) -- need Neovim 0.10.0+
    end,
  },
}
