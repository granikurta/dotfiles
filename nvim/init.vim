set termguicolors
set incsearch ignorecase smartcase hlsearch
set noswapfile
set wildmode=longest,list,full wildmenu
set laststatus=2
set title
set relativenumber
set number
set ts=4 sw=4
set clipboard^=unnamed,unnamedplus
set completeopt = "noinsert,menuone,noselect"
set encoding=UTF-8
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rose-pine/neovim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'neovim/nvim-lspconfig'
"Plug 'folke/noice.nvim'
"Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " autocomplete
Plug 'saadparwaiz1/cmp_luasnip' " autocomplete
Plug 'rafamadriz/friendly-snippets' "Snippets collection
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "hightlight syn
Plug 'diegoulloao/neofusion.nvim'
"Plug 'tpope/vim-dadbod' " database 
"Plug 'kristijanhusak/vim-dadbod-ui'
"Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'stevearc/conform.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'catgoose/nvim-colorizer.lua'
" post install (yarn install | npm install) then load plugin only for editing supported files
call plug#end()

lua require("tree")
lua require("ui")
lua require("plugin/telescope")
lua require("rose_pine_config")
lua require("lspconfig_config")
lua require("diagnostic")
"lua require("builtin_lsp")
lua require("cmp_config")
lua require("treesitter_config")
lua require("keymap")
lua require("format")
lua require("gitsign")

" mayble move to lua/git_config.lua

let g:neocomplete#enable_at_startup = 1

let g:db_ui_use_nerd_fonts=1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"set background=dark
"colorscheme neofusion
nnoremap <C-h> <cmd>bprev<cr>
nnoremap <C-l> <cmd>bnext<cr>
nnoremap <C-c> <cmd>bw<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep_args<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope lsp_references<cr>  " Under cursor

nnoremap <leader>fs <cmd>Telescope grep_string<cr> " Searches for the string under your cursor or selection in your current working directory

nnoremap <leader>hp <cmd>Gitsigns preview_hunk<CR>

nnoremap <Leader><space> <cmd>let @/ = ""<cr>
nnoremap <leader>d <cmd>lua vim.diagnostic.setloclist() <cr>
"nnoremap gp :silent %!prettier --stdin-filepath %<CR>
