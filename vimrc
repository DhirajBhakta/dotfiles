:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
":set mouse=a
:set mouse=v
:set wildmenu
:set cursorline
:set incsearch
:set shortmess-=S
:set hlsearch 

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" stop the annoying prompt to save the file
" before opening another file
:set hidden

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" very much like FZF
:set path+=**


" now we can...
" - do FZF stuff!
" - Hit tab to :find by partial match
" - Use * to make it fuzzzy

" things to consider
" - :b lets you autocomplete any open buffer
"

let g:netrw_banner=0              " disable annoying banner
let g:netrw_browse_split=4
let g:netrw_altv=1                " open splits to the right
let g:netrw_liststyle=3           " tree view
let g:netrw_winsize=80
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

" now we can...
" - do NERDTree stuff!
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check | netrw-browse-maps | for more mappings


call plug#begin()

Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/tpope/vim-fugitive' " Git stuff

" >>>Conquer Of Completion - turned off by default
Plug 'https://github.com/neoclide/coc.nvim'  
Plug 'https://github.com/hashivim/vim-terraform'
"
" >>>FZF (Fuzzy Search) - turned off by default
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" >>>Web development - turned off by default
Plug 'prettier/vim-prettier', " Prettier for JS TS React development
set encoding=UTF-8
call plug#end()

nmap     <C-p> :find 


:set completeopt-=preview " For No Previews
:set wildignore+=node_modules/** " exclude from vimgrep
:set wildignore+=venv/** " exclude from vimgrep

:colorscheme gruvbox
:set bg=dark


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-go
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nmap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >=0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction





" //////////////////////////////////////////////////
" ALL MY CUSTOM SHITE ------------------------------
" //////////////////////////////////////////////////
:command Todo :noswapfile tabedit $HOME/todo.md

" Vim templates for Fictoan
:command Frow :read ~/Development/.vim-templates/fictoan-row
:command Clip set mouse=v nonumber norelativenumber paste
:command NoClip set mouse=v number relativenumber paste
nmap copen	:copen<CR>
nmap ccl	:ccl<CR>
nmap cnext	:cnext<CR>
nmap lex	:30Lex %:h<CR><CR>
nmap vres	:vertical resize30<CR>
nmap crun       :!g++ % -o %< && ./%< && rm %< <CR>
vmap clip	:w !xclip
set pastetoggle=<F3>


