vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmenu = true
vim.opt.hlsearch = true
vim.opt.mouse = "nicra"
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.undofile = true

vim.opt.shiftround = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.g.copilot_no_tab_map = true

-- Key bindings
-- Navigate between splits with Ctrl + h/j/k/l
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true, script = true })

-- Auto commands to only set the cursorline in the active buffer
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    command = "setlocal nocursorline",
})

-- Auto command to set filetype for React/TypeScript files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.tsx,*.jsx,*.js,*.ts",
    command = "set filetype=typescriptreact",
})


require('catppuccin').setup({
    no_italic = true,
})
vim.cmd.colorscheme("catppuccin")
