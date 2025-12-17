require "fzf-lua".setup {
    files = {
        cmd = "ag -l --nocolor --ignore-dir third-party"
    },
    grep = {
        cmd = "ag --nocolor --ignore-dir third-party"
    },
    live_grep = {
        cmd = "ag --nocolor --ignore-dir third-party"
    }
}

vim.api.nvim_set_keymap("n", "<C-b>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-S-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".live_grep()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-S-g>", [[<Cmd>lua require"fzf-lua".grep()<CR>]], {})
-- Grep word under cursor, Ctrl-*
vim.api.nvim_set_keymap("n", "<C-S-8>", [[<Cmd>lua require"fzf-lua".grep_cword()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-S-r>", [[<Cmd>lua require"fzf-lua".lsp_references()<CR>]], {})
-- vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})
