" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'vim-scripts/closeb'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/Cpp11-Syntax-Support'
Plugin 'ciaranm/detectindent'
Plugin 'othree/html5.vim'
Plugin 'tmhedberg/matchit'
Plugin 'hdima/python-syntax'
Plugin 'luochen1990/rainbow'
Plugin 'msanders/snipmate.vim'
" Plugin 'chase/vim-ansible-yaml'
" Plugin 'MicahElliott/Rocannon'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tikhomirov/vim-glsl'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-commentary'

" theme
Plugin 'freeo/vim-kalisi'

" TODO configure
Plugin 'AndrewRadev/sideways.vim'
Plugin 'mbbill/undotree'

Plugin 'neomake/neomake'

call vundle#end()
filetype plugin indent on

" generic
set tabstop=8
set softtabstop=4
set expandtab
set nu
set shiftwidth=4
set textwidth=79
set modeline
set noincsearch

colorscheme kalisi
set background=dark
set t_Co=256

" disable autoreindenting when typing
set indentkeys=

" load project local settings
set exrc
set secure

" make hjkl work on display lines instead of logical lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" window navigation
nnoremap h <C-w>h
nnoremap j <C-w>j
nnoremap k <C-w>k
nnoremap l <C-w>l
nnoremap w <C-w>q

" yank to end of line
nnoremap Y y$

" syncs keyboard with system
" suppresses yanking on selection, but enables it in command mode
" set clipboard=unnamedplus,autoselectml

" omni completion
inoremap <C-@> <C-x><C-o>

" disable F1
nmap <F1> :ls<CR>
imap <F1> <nop>

" unmap ex mode
nmap Q <nop>

" indent everything
nnoremap <C-f> mygg=G`y

" copy/paste
nnoremap <C-c> "+yy
vnoremap <C-c> "+y

" select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" no highlight
nnoremap <Space> :noh\|echo<CR>

" surround word with S
nnoremap S ysiw

" display incomplete long lines
set display=lastline

" Remove trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e

" workaround for delay of certain commands, ie. `O`
set ttimeoutlen=50
" scroll with cursor
set scrolloff=9

" matching parens
hi clear MatchParen
hi MatchParen cterm=bold,underline

" mouse for all modes
set mouse=a

" virtual cursor - can move past end of line
set ve=all

" paste mode (no autoindent)
set pastetoggle=<F11>

" airline
set laststatus=2
"let g:airline_theme="bubblegum"
let g:airline_theme="understated"

" sideways - movin function arguments
nnoremap <leader>h :SidewaysLeft<cr>
nnoremap <leader>l :SidewaysRight<cr>

" syntax highlighting
syntax on
filetype plugin indent on

" neomake options
au BufWritePost *.py Neomake
au BufWritePost *.c Neomake
au BufWritePost *.rb Neomake
let g:neomake_warning_sign = {'text': '▶▶', 'texthl': 'NeomakeWarningSign'}
let g:neomake_error_sign = {'text': '▶▶', 'texthl': 'NeomakeErrorSign'}
let g:neomake_pep8_args = ['--max-line-length=90']
hi NeomakeErrorSign ctermfg=red ctermbg=0
hi NeomakeWarningSign ctermfg=yellow ctermbg=0

command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry
nnoremap - :Lnext<cr>
nnoremap _ :Lprev<cr>

" Do not indent public/protected/private in c++
set cino+=g0


" rainbow parentheses
" au VimEnter * RainbowParenthesesActivate
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:rainbow_active = 1
let g:rainbow_conf = {
            \       'separately': {
            \               'xhtml': 0,
            \               'html': 0,
            \               'xml': 0,
            \       }
            \}


" colors
hi clear Search
hi clear Todo
hi Search ctermbg=16
hi Todo ctermfg=2 cterm=bold
" hi Folded ctermbg=53 ctermfg=15
" hi FoldColumn ctermbg=53 ctermfg=15
hi Pmenu ctermbg=22 ctermfg=15
hi PmenuSbar ctermbg=0
hi PmenuSel ctermbg=0 ctermfg=28 cterm=bold
hi PmenuThumb ctermbg=34
" hi Constant ctermfg=142
" hi Special ctermfg=1

" signature
hi SignColumn ctermbg=0
let g:SignatureMarkOrder="\m>"
" let g:SignatureMarkTextHL="Todo"
" let g:SignatureMarkerTextHL="SyntasticError"

" blink when jumping among searched items
hi SearchBlink ctermbg=15
nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('SearchBlink', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" Highlight tabs and trailing whitespace
exec "set listchars=tab:»»,trail:«,nbsp:⇔"
set list
hi clear SpecialKey

" Save *.swp files in ~/.vimswp
set dir=~/.vimswp//
set undofile
set undodir=~/.vimswp//

let python_highlight_all = 1

" insert time
nnoremap <F5> i<C-R>=strftime("%T")<CR><ESC>l
inoremap <F5> <C-R>=strftime("%T")<CR>

nnoremap <F4> i<C-R>=strftime("%F")<CR><ESC>l
inoremap <F4> <C-R>=strftime("%F")<CR>

nnoremap <C-E> :%Eval<CR>

" customize autocomplete
set completeopt=longest,menuone,preview

au BufRead,BufNewFile *.spec
    \ setlocal comments-=:% commentstring=#%s

" do not continue comments, but format them
au BufRead,BufNewFile * setlocal formatoptions=qn1j
au FileType c,cpp setlocal comments-=:// comments+=f:// formatoptions+=c
au FileType python setlocal indentkeys-=<:>
au FileType ruby,eruby setlocal sw=2

autocmd BufRead,BufNewFile *.tex
    \ setlocal filetype=tex wrap formatoptions+=tc indentkeys=

" asciidoc highlighting, indent, width
" autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
"             \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
"             \ textwidth=72 wrap formatoptions+=tc
"             \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+\\\\|^\\s*\\*\\+\\s\\+
"             \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

" autoclose fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

au BufRead,BufNewFile *.yml setlocal filetype=ansible indentexpr= nofoldenable
au BufRead,BufNewFile *.xml setlocal sw=2

" ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

nnoremap <C-p> :FZF<CR>

" NEDRTree
nnoremap <F2> :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']

" highlight last column
set cc=+1,+11
hi ColorColumn ctermbg=239

" custom commands
command! -range MakeSubpackage <line1>,<line2>s/^\s*\(.*\)/%package \1\rSummary:
            \        \1 module for %{name}\r\r\
            \%description \1\r\1 module for %{name}.\r/ |noh
