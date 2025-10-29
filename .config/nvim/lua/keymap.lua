-- Copy to Clipboard
vim.keymap.set("n", "<leader>y", "+y")
vim.keymap.set("n", "<leader>yy", "+yy")
vim.keymap.set("n", "<leader>Y", "+yg_")
vim.keymap.set("v", "<leader>y", "\"+y")
-- Paste from Clipboard
vim.keymap.set("n", "<leader>p", "+P")
vim.keymap.set("n", "<leader>P", "+p")
vim.keymap.set("v", "<leader>p", "+P")
vim.keymap.set("v", "<leader>P", "+p")

-- Newline under the current line
vim.keymap.set("n", "<leader><Enter>", "o<Esc>k")

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })

-- Change text width
vim.keymap.set("n", "<leader>tw1", ":set colorcolumn=140<CR>")
vim.keymap.set("n", "<leader>tw2", ":set colorcolumn=100<CR>")
vim.keymap.set("n", "<leader>tw3", ":set colorcolumn=70<CR>")
vim.keymap.set("n", "<leader>twr", ":set colorcolumn=0<CR>")
