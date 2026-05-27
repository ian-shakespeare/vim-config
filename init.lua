-- Core settings
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"


-- Remaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", ":bd <bar> :pbrev <cr>", { silent = true })
vim.keymap.set("n", "<tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-tab>", vim.cmd.bprev)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)


-- Install packages
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- dependency for telescope
	"https://github.com/nvim-telescope/telescope.nvim", -- file search/live grep
	"https://github.com/nvim-treesitter/nvim-treesitter", -- treesitter
	"https://github.com/rose-pine/neovim", -- theme
	"https://github.com/akinsho/bufferline.nvim", -- shows open buffers
	"https://github.com/neovim/nvim-lspconfig", -- LSP client configs
  "https://github.com/mason-org/mason.nvim", -- LSP install manager
  "https://github.com/hrsh7th/nvim-cmp", -- better LSP interactions
})


-- Packages config
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fw", telescope.live_grep)

local treesitter = require("nvim-treesitter")
treesitter.install({
  "go",
  "rust",
  "javascript",
  "typescript",
  "html",
})
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

local rosepine = require("rose-pine")
rosepine.setup({
  disable_background = true,
})
vim.cmd("colorscheme rose-pine")
vim.cmd(":hi statusline guibg=NONE")

local bufferline = require("bufferline")
bufferline.setup()

local mason = require("mason")
mason.setup()

local cmp = require("cmp")
cmp.mapping.preset.insert({
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- LSP
vim.lsp.enable({
	"lua_ls",
	"gopls",
	"rust_analyzer",
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})
