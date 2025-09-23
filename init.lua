vim.opt.mouse = ""
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.showtabline = 0
vim.opt_local.conceallevel = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.spelllang = 'en,de'

vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.g.mapleader = " "

vim.keymap.set('t', '<ESC>', '<C-\\><C-N>')

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.md', '*.typ' },
  callback = function()
    vim.opt.spell = true
  end
})

vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/echasnovski/mini.pick' },
  { src = 'https://github.com/echasnovski/mini.icons' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/chomosuke/typst-preview.nvim",    version = 'v1.3.2' },
  { src = "https://github.com/Vigemus/iron.nvim" },
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/jmbuhr/otter.nvim" },
  { src = "https://github.com/quarto-dev/quarto-nvim" },
  { src = "https://github.com/folke/flash.nvim" },
  { src = "https://github.com/Saghen/blink.cmp",                version = 'v1.6.0' },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-flutter/flutter-tools.nvim" },
  { src = "https://github.com/obsidian-nvim/obsidian.nvim" },
})

require "mini.icons".setup()
require "obsidian".setup({
  legacy_commands = false,
  workspaces = {
    {
      name = "obsidian_vault",
      path = "/Users/robin/obsidian_vault",
    }
  },
})

require "mini.pick".setup()
vim.ui.select = MiniPick.ui_select
require "mason".setup()
require "mason-lspconfig".setup()
require "oil".setup()
require "luasnip".setup({ enable_autosnippets = true })
require "luasnip.loaders.from_lua".load({ paths = "~/.config/nvim/snippets" })
require "typst-preview".setup()
require "flash".setup()
require "flutter-tools".setup {}

require "nvim-autopairs".setup({
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.]"
})

require "blink.cmp".setup({
  completion = {
    menu = {
      auto_show = false
    },
    list = {
      selection = { preselect = true, auto_insert = false },
    }
  },
  keymap = {
    ['<C-d>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-n>'] = { 'show_and_insert', 'select_next' },
    ['<C-l>'] = { 'accept' },
  },
  snippets = { preset = 'luasnip' },
  sources = {
    default = { 'path', 'lsp', 'snippets' },
  }
})

local iron = require("iron.core")
iron.setup {
  config = {
    repl_definition = {
      julia = {
        command = { "julia", "--project=@." }
      },
      python = {
        command = { "python" },
        format = require("iron.fts.common").bracketed_paste,
      },
      r = {
        command = { "R" }
      }
    },
    repl_open_cmd = "vertical botright 80 split"
  },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.r', '*.py', '*.jl' },
  callback = function()
    iron.setup({
      keymaps = {
        send_paragraph = "<C-l>",
        visual_send = "<C-l>",
        send_line = "<leader>sl",
        restart_repl = "<leader>sr",
        send_until_cursor = "<leader>sa",
        send_file = "<leader>sA",
        cr = "<leader>sc",
        interrupt = "<leader>si"
      }
    })
    vim.keymap.set("n", "<C-j>", '}j')
    vim.keymap.set("n", "<C-k>", '{{j')
  end
})

require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black" },
    r = { "air" },
    markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>g', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set({ "i" }, "<C-e>", function() require "luasnip".expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() require "luasnip".jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-k>", function() require "luasnip".jump(-1) end, { silent = true })
vim.keymap.set({ "n", "x" }, "s", function() require "flash".jump() end)
vim.keymap.set({ "o" }, "r", function() require "flash".remote() end)

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 's', 'i', 't', 'MiniPick' }
      }
    }
  }
})

vim.lsp.enable({ 'lua_ls', 'tinymist', 'bashls', 'marksman', 'pyright',
  'julials', 'yamlls', 'jsonls', 'r_language_server' })

vim.cmd('colorscheme vague')
