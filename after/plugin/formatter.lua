require("formatter").setup {
  filetype = {
    javascript = require("formatter.filetypes.javascript").prettier,
    typescript = require("formatter.filetypes.typescript").prettier,
    javascriptreact = require("formatter.filetypes.javascriptreact").prettier,
    typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
    html = require("formatter.filetypes.html").prettier,
    python = require("formatter.filetypes.python").autopep8,
    go = require("formatter.filetypes.go").gofmt,
    rust = require("formatter.filetypes.rust").rustfmt,
    svelte = require("formatter.filetypes.svelte").prettier,
    elixir = require("formatter.filetypes.elixir").mixformat,
  }
}

vim.keymap.set("n", "<leader>cf", ":FormatWrite <cr>")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
