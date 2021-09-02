call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'                                       " Git version control
Plug 'gruvbox-community/gruvbox'                                " Color scheme
Plug 'neovim/nvim-lspconfig'                                    " Language server
Plug 'simrat39/symbols-outline.nvim'				            " Highlight current symbol
Plug 'tpope/vim-sensible'					                    " Some sensible vim defaults everyone should use
Plug 'hrsh7th/nvim-compe'                                       " Autocompletions
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 	" Syntax highlights
Plug 'christoomey/vim-tmux-navigator'					        " Seamless navigation between tmux and vim

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

" General
let mapleader=" "
nnoremap ää :update<CR>

" Config edit
nnoremap <leader>rc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>

lua require("configuration")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

" Git log navigation
nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
