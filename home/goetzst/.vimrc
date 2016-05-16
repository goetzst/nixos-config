noremap j gj
noremap k gk

" fix bold colors?
set term=rxvt-unicode

set hlsearch
set is

syntax on
filetype plugin indent on

set nocompatible
set background=dark
set number
set showcmd
set showmatch
set ignorecase
set nojoinspaces
set scrolloff=3
set timeoutlen=0
set showmode
set smartcase
set smarttab
set smartindent
set tabstop=8
set shiftwidth=8
set expandtab
set incsearch
set modeline

" folds look hoorible in current colorscheme
set nofoldenable

" nice linewrapping
set linebreak

set cc=120

set completeopt=menu,menuone,longest,preview

" colorsheme
colorscheme peachpuff

" extra whitespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set autoindent
set t_Co=256

set cmdheight=1

" execute pathogen#infect()

" syntaxchecking Syntastic
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ghcMod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" vim2hs configs
let g:haskell_conceal_wide = 1
