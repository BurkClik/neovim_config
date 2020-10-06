call plug#begin("~/.vim/plugged")
	" Plugin Section
	" Themes
	Plug 'dracula/vim'
	Plug 'danilo-augusto/vim-afterglow'
	Plug 'nightsense/carbonized'
	Plug 'mhartington/oceanic-next'
	Plug 'hardcoreplayers/oceanic-material'
	Plug 'sainnhe/sonokai'
	Plug 'jacoborus/tender.vim'
	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" Auto pairs for '{' '[' '{'
	Plug 'jiangmiao/auto-pairs'
	" Status Line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Nerdtree
	Plug 'scrooloose/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
	" Search in file
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	" Intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-rust-analyzer', 'coc-flutter']
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
call plug#end()

"Config Section
if (has("termguicolors"))
	set termguicolors
endif
" syntax enable
" colorscheme OceanicNext
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai


set number

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusLine = ''
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-w>h
tnoremap <A-j> <C-\><C-w>j
tnoremap <A-k> <C-\><C-w>k
tnoremap <A-l> <C-\><C-w>l
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l


nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}


let $FZF_DEFAULT_COMMAND = 'ag -g""'

" set encoding=utf8
set guifont=FiraCode\ Medium\ Font\ 11

set shell=/usr/bin/zsh

source $HOME/.config/nvim/themes/airline.vim
