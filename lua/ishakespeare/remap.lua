vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", ":bd <bar> :bprev <cr>", { silent = true })
vim.keymap.set("n", "<tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-tab>", vim.cmd.bprev)

-- Go error handling
vim.keymap.set("n", "@e", "oif err != nil {<Enter><Enter>}<Esc>ka<Tab>", { silent = true })
