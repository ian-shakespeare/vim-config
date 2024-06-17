local function format_python()
  return {
    exe = "python3 -m autopep8",
    args = { "--in-place", "--aggressive" },
    stdin = false,
    ignore_exitcode = true,
  }
end

require("formatter").setup {
  filetype = {
    javascript = require("formatter.filetypes.javascript").prettier,
    typescript = require("formatter.filetypes.typescript").prettier,
    javascriptreact = require("formatter.filetypes.javascriptreact").prettier,
    typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
    python = { format_python }
  }
}

vim.keymap.set("n", "<leader>cf", ":Format <cr>")
