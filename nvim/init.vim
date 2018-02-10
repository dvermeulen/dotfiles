set runtimepath+=/home/dez/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/dez/.local/share/dein')
  call dein#begin('/home/dez/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/dez/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/deoplete.nvim')
  call dein#add("SirVer/ultisnips")
  call dein#add("honza/vim-snippets")
  call dein#add("morhetz/gruvbox")
  call dein#add("tpope/vim-fugitive")
  call dein#add("tpope/vim-rhubarb")
  call dein#add("tpope/vim-sensible")
  call dein#add("jeffkreeftmeijer/vim-numbertoggle")
  call dein#add("vim-airline/vim-airline")
  call dein#add("ctrlpvim/ctrlp.vim")
  call dein#add("neomake/neomake")
  call dein#add("godlygeek/tabular")
  call dein#add("tpope/vim-surround")
  call dein#add("junegunn/vim-peekaboo")
  call dein#add("docker/docker")
  call dein#add("chr4/nginx.vim")

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" deoplete config
let g:deoplete#enable_at_startup = 1
" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"if has("gui_vimr")
  set background=dark
  colorscheme gruvbox
  let g:airline_theme= 'gruvbox'
"endif

set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
scriptencoding utf-8                        " Set utf-8 as default script encoding

set shell=/usr/local/bin/zsh                          " Setting shell to zsh
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
set textwidth=120                           " Text width is 120 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set synmaxcol=220                           " Don't try to syntax highlight minified files

set number relativenumber

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Stop cursor from jumping over wrapped lines
nnoremap j gj
nnoremap k gk

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Map ; to :
nnoremap ; :

" Plugin Settings {
    " Airline {
        let g:airline_powerline_fonts = 1
    " }
    " CtrlP {
        " Open file menu
        nnoremap <Leader>o :CtrlP<CR>
        " Open buffer menu
        nnoremap <Leader>b :CtrlPBuffer<CR>
        " Open most recently used files
        nnoremap <Leader>f :CtrlPMRUFiles<CR>
    " }
    " neomake {
        nnoremap <Leader>l :lopen<CR>
    " }
    " neomake {
        let g:netrw_liststyle=3 " tree (change to 0 for thin)
        let g:netrw_banner=0    " no banner
        let g:netrw_altv=1      " open files on right
        let g:netrw_winsize=80  " only use 20% screen for netrw
        " FIXME: Preview opens to left and is very narrow
        let g:netrw_preview=1   " open previews vertically
    " }
" }

set splitbelow
set splitright

let mapleader="\<SPACE>"

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" apt-get install shellcheck
autocmd BufWritePost *.sh Neomake shellcheck
" pip3 install vim-vint
autocmd BufWritePost *.vim Neomake vint

