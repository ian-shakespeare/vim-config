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
    python = { format_python }
  }
}

vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite"
})
