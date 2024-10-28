:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set wildmenu
:set cursorline

" Enable plugins and load plugin for the detected file type
filetype plugin on
set omnifunc=vim.lsp.omnifunc


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
let g:netrw_winsize=90
let g:netrw_banner=0              " disable annoying banner
let g:netrw_browse_split=4        " open in prior window
let g:netrw_altv=1                " open splits to the right
let g:netrw_liststyle=3           " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

" now we can...
" - do NERDTree stuff!
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check | netrw-browse-maps | for more mappings

nmap     <C-p> :find 


:set completeopt-=preview " For No Previews
:set wildignore+=node_modules/** " exclude from vimgrep
:set wildignore+=venv/** " exclude from vimgrep

filetype plugin indent on
syntax on


call plug#begin()
Plug 'marko-cerovac/material.nvim'
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/tpope/vim-fugitive'

Plug 'nvim-treesitter/nvim-treesitter'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

"Autocompletion
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'dev-v3'}
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

"Dev environment
Plug 'ray-x/go.nvim'

"AI
Plug 'Exafunction/codeium.vim'

call plug#end()

let g:material_style = "palenight"
:colorscheme material

lua <<EOF
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
	lsp.buffer_autoformat()
end)
lsp.extend_cmp()

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'tsserver','gopls'},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
			end,
		},

})
EOF

lua <<EOF
-- go.nvim setup
require 'go'.setup({
	tag_transform = false,
	test_dir = '',
	comment_placeholder = ' comment ',
	lsp_cfg = true,
	lsp_gofumpt = true,
	lsp_on_attach = true,
})
local protocol = require'vim.lsp.protocol'
EOF




" ALL MY CUSTOM SHITE
:command Todo :noswapfile tabedit $HOME/todo.md
:command Clip set mouse=v nonumber norelativenumber paste
:command NoClip set mouse=v number relativenumber paste
nmap copen	:copen<CR>
nmap ccl	:ccl<CR>
nmap cnext	:cnext<CR>
nmap lex	:30Lex %:h<CR><CR>
nmap vres	:vertical resize30<CR>
nmap crun       :!g++ % -o %< && ./%< && rm %< <CR>
vmap clip	:w !xclip
