require("formatter").setup {
  filetype = {
    javascript = require("formatter.filetypes.javascript").prettier,
    typescript = require("formatter.filetypes.typescript").prettier,
    javascriptreact = require("formatter.filetypes.javascriptreact").prettier,
    typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
    python = require("formatter.filetypes.python").autopep8,
    go = require("formatter.filetypes.go").gofmt,
    rust = require("formatter.filetypes.rust").rustfmt,
  }
}

vim.keymap.set("n", "<leader>cf", ":FormatWrite <cr>")
