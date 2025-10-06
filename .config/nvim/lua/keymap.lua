-- Move line up/down
vim.keymap.set("n", "<A-Up>", ":m -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":m +1<CR>", { noremap = true, silent = true })
-- Move line up/down in visual mode
vim.keymap.set("v", "<A-Up>", ":m -2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m +1<CR>gv=gv", { noremap = true, silent = true })

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

-- Neo-tree
vim.keymap.set("n", "<leader>tt", ":Neotree action=focus<CR>")
vim.keymap.set("n", "<leader>tc", ":Neotree action=close<CR>")

-- Change text width
vim.keymap.set("n", "<leader>tw1", ":set colorcolumn=140<CR>")
vim.keymap.set("n", "<leader>tw2", ":set colorcolumn=100<CR>")
vim.keymap.set("n", "<leader>tw3", ":set colorcolumn=70<CR>")
vim.keymap.set("n", "<leader>twr", ":set colorcolumn=0<CR>")

-- Leap
vim.keymap.set('n', 'f', '<Plug>(leap)')
vim.keymap.set('n', 'F', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 'f', '<Plug>(leap-forward)')
vim.keymap.set({ 'x', 'o' }, 'F', '<Plug>(leap-backward)')
