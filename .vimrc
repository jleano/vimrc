" START vundle config
" https://github.com/gmarik/vundle#about
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'UltiSnips'
Bundle 'honza/vim-snippets'
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/syntastic'
"Bundle 'myusuf3/numbers.vim'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'vcscommand.vim'
" Bundle 'mhinz/vim-startify'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'christoomey/vim-tmux-navigator'
" Remove existing indent bundle to try this out.
Bundle 'pangloss/vim-javascript'
"" This is the existing one.
"http://www.vim.org/scripts/script.php?script_id=3227

Bundle 'bling/vim-airline'
" Try a new buffer plugin
Bundle 'fholgado/minibufexpl.vim'
"Bundle 'bling/vim-bufferline'
"Bundle 'mkitt/tabline.vim'



"  :BundleInstall to install bundles
" :BundleInstall! (note the !) to update them
" :BundleClean after deleting from vimrc to remove
" END vundle config

"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase

" *****************************************
" http://items.sjbach.com/319/configuring-vim-right
let mapleader=','
set history=1000
set wildmenu
set wildmode=list:longest
set title
set scrolloff=3

syntax on
filetype plugin on
filetype indent on
"set hlsearch
set incsearch

" *****************************************
" http://sontek.net/turning-vim-into-a-modern-python-ide
" za to fold and unfold
set foldmethod=indent
set foldlevel=99

let g:pep8_map='<leader>8'

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" *****************************************
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType="context"
"set completeopt=menu " < -http://thecatatemysourcecode.posterous.com/vim-python-tab-completion

" *****************************************
" http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/
" set number
map <leader>n :NERDTreeToggle<CR>

let g:CommandTMaxFiles=40000

"set wildignore+=*.o,*.obj,.git
set wildignore+=*.pyc,*/CVS/*,*gif,*jpeg,*/extracted/*,*~

"" setup pylint
" autocmd FileType python compiler pylint


" http://vim.wikia.com/wiki/Avoid_the_escape_key
" imap <S-CR> <Esc>
" imap <S-Space> <Esc>
imap jj <Esc>

" *****************************************
" http://www.vim.org/scripts/script.php?script_id=1318
" snippets installed, work to expand

" *****************************************
" From srwkenv vimrc
set ruler
set pastetoggle=<F2>    " Hitting F2 will allow you to paste text into
                        " the editor without it trying to auto-indent the
                        " text.  This is helpful if the pasted text is
                        " already indented.
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history


" Add a command for executing shell commands in a scratch window.
" Will re-use an existing scratch window or create a new one if needed.
"function! s:ExecuteInShell(command)
"    let command = join(map(split(a:command), 'expand(v:val)'))
"    let winnr = bufwinnr('^' . command . '$')
"    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
"    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile
"    echo 'Execute ' . command . '...'
"    silent! execute 'silent %!'. command
"    silent! execute 'resize 15'
"    silent! redraw
"    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
"    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
"    silent! execute "$"
"    echo 'Shell command ' . command . ' executed.'
"endfunction
"
"command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

" command! Pylint call s:ExecuteInShell("pylint " . expand("%:p"))
"command! Runtests call s:ExecuteInShell("~/sri/bzr/srwkenv/trunk/bin/runtests " . expand("%:p"))


" http://www.held.org.il/blog/2011/02/configuring-ctags-for-python-and-vim/
" set tags=~/mytags

" http://www.vim.org/scripts/script.php?script_id=273
" Taglist plugin
" Remove for now, does not work well with minibufferexplorer
" nnoremap <silent> <F8> :TlistToggle<CR>

colorscheme oceandeep
" http://www.yolinux.com/TUTORIALS/LinuxTutorialAdvanced_vi.html
set bg=dark
" Comment out the below since ctrlk is already mapped to jump to window above
" nmap <leader>k k
" https://github.com/fholgado/minibufexpl.vim
" this is more up to date minibufexpl, try sometime soon

"http://www.vim.org/scripts/script.php?script_id=159
" force next buffer to be rehighlighted when closing/deleting buffer
let g:miniBufExplForceSyntaxEnable = 1

" force better syntax highlighting
let g:python_slow_sync=1
let g:python_highlight_space_errors=0
let g:python_highlight_all=1

" http://vimdoc.sourceforge.net/htmldoc/quickfix.html#quickfix
" map <leader>e :cn<Cr>
" Syntastic uses location list instead of error list which flake8 had used
map <leader>e :lne<Cr>

" don't record individual letter deletes to yankring
let g:yankring_min_element_length=1

" http://www.reddit.com/r/vim/comments/qmsq1/vimrc_config_that_will_highlight_characters_in_a/
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#808080
highlight OverLength ctermbg=darkred ctermfg=white guibg=#808080
" match OverLength /\%>79v.\+/
""  match OverLength /\%>79v./


" options to configure vim73 install
" ./configure --enable-pythoninterp --enable-rubyinterp --with-features=huge
" --enable-gui=gnome2
" set colorcolumn
set colorcolumn=81

" http://www.vim.org/scripts/script.php?script_id=3465
nnoremap <silent> <F9> :TagbarToggle<CR>
map <leader>q :TagbarToggle<Cr>
let g:tagbar_left = 0
let g:tagbar_width = 40


" For additional autocfg details, see:
" https://bitbucket.org/agr/ropevim
"map <leader>g :RopeGotoDefinition<Cr>
"map <leader>d :RopeShowDoc<Cr>
"map <leader>f :RopeFindOccurences<Cr>

" http://www.bestofvim.com/tip/trailing-whitespace/
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Removes trailing spaces
function! TrimWhiteSpace()
     %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
" autocmd FileWritePre    * :call TrimWhiteSpace()
" autocmd FileAppendPre   * :call TrimWhiteSpace()
" autocmd FilterWritePre  * :call TrimWhiteSpace()
" autocmd BufWritePre     * :call TrimWhiteSpace()
autocmd FileType python autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType python autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FileType python autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd FileType python autocmd BufWritePre     * :call TrimWhiteSpace()

" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

" https://github.com/nvie/vim-flake8
"let g:flake8_max_line_length=130
"let g:flake8_ignore="E122,E121,E123,E124,E125,E126,E127,E128"

"autocmd BufWritePost *.py call Flake8()

" https://github.com/scrooloose/syntastic
" let g:syntastic_python_checkers=['pylint', 'flake8', 'pyflakes', 'python']
let g:syntastic_always_populate_loc_list=1
" http://stackoverflow.com/questions/15457887/how-to-set-up-syntastic-for-vim
" let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1

" http://blog.realnitro.be/2010/12/20/format-json-in-vim-using-pythons-jsontool-module/
" map <Leader>j !python -m json.tool<CR>

" http://jeffkreeftmeijer.com/2013/vims-new-hybrid-line-number-mode/
" set relativenumber
" set number

" https://github.com/myusuf3/numbers.vim
nnoremap <F3> :NumbersToggle<CR>
"nnoremap <F4> :NumbersOnOff<CR>
"
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
let g:UltiSnipsExpandTrigger="<c-j>"
" set the directory in vim-snippet plugin.
let g:UltiSnipsSnippetDirectories=["UltiSnips", "customsnippets"]

"https://github.com/Valloric/YouCompleteMe
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <F4> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" https://github.com/myusuf3/numbers.vim
let g:numbers_exclude = ['minibufexpl', 'nerdtree', 'unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m']

" turn on bufferline
let g:bufferline_show_bufnr = 1
