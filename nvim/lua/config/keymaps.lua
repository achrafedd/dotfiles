local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save file
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Select all (Devaslife signature)
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Increment / Decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Delete word backwards (Devaslife signature)
keymap("n", "dw", 'vb"_d', opts)

-- Delete single character without copying to register (Devaslife signature)
keymap("n", "x", '"_x', opts)

-- Split window (Devaslife signature: ss, sv)
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Move window (Devaslife signature: sh, sj, sk, sl)
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Resize window
keymap("n", "<C-w><left>", "<C-w><", opts)
keymap("n", "<C-w><right>", "<C-w>>", opts)
keymap("n", "<C-w><up>", "<C-w>+", opts)
keymap("n", "<C-w><down>", "<C-w>-", opts)

-- Buffer Navigation
keymap("n", "<leader>x", ":bdelete<CR>", opts)

-- Visual indenting keep selection
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move line / selection up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Terminal
keymap("n", "<leader>t", ":split term://bash | startinsert<CR>", opts)
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Commenting (VS Code keymaps: Ctrl+/ for line comment, Alt+Shift+A for block comment)
keymap("n", "<C-/>", "gcc", { remap = true, desc = "Toggle line comment" })
keymap("n", "<C-_>", "gcc", { remap = true, desc = "Toggle line comment" })
keymap("v", "<C-/>", "gc", { remap = true, desc = "Toggle line comment" })
keymap("v", "<C-_>", "gc", { remap = true, desc = "Toggle line comment" })
keymap("i", "<C-/>", "<Esc>gccgi", { remap = true, desc = "Toggle line comment" })
keymap("i", "<C-_>", "<Esc>gccgi", { remap = true, desc = "Toggle line comment" })

keymap("n", "<A-S-a>", "gbc", { remap = true, desc = "Toggle block comment" })
keymap("v", "<A-S-a>", "gb", { remap = true, desc = "Toggle block comment" })
keymap("i", "<A-S-a>", "<Esc>gbcgi", { remap = true, desc = "Toggle block comment" })

