vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", ":bd <bar> :bprev <cr>")
vim.keymap.set("n", "<tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-tab>", vim.cmd.bprev)
