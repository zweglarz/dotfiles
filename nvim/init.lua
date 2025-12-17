local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('peitalin/vim-jsx-typescript')

-- Git integration
Plug('tpope/vim-fugitive')

-- Fuzzy Finder
Plug('ibhagwan/fzf-lua')

-- Noice UI
Plug('MunifTanjim/nui.nvim')
Plug('rcarriga/nvim-notify')
Plug('nvim-treesitter/nvim-treesitter')
Plug('folke/noice.nvim')

-- LSP and Autocompletion
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
-- Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
Plug('ray-x/lsp_signature.nvim')

Plug('github/copilot.vim')

vim.call('plug#end')

require('vim_settings')
require('lsp_settings')
require("fzf")

require('nvim-treesitter').install { "javascript", "typescript", "tsx", "lua", "json", "html", "css", "regex", "bash", "python" }

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
    signature = {
      enabled = false, -- disable lsp_signature integration, as we are using ray-x/lsp_signature.nvim
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})
