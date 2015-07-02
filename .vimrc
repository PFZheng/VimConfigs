if has ("win32")
    let $HOME=$VIMRUNTIME.'/../'
    "let g:tagbar_ctags_bin=$HOME.'/vim/ctags.exe'
    let g:neocomplcache_ctags_program=$VIMRUNTIME.'/ctags.exe'
    let g:tagbar_systemenc = 'GBK'
endif

"设置neobundle
set nocompatible " be iMproved

if has ("win32")
    if has('vim_starting')
        set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
    endif
    call neobundle#begin(expand('$HOME/vimfiles/bundle/'))
    let $CONFIG_DIR=$HOME.'/vimfiles/'
else
    if has('vim_starting')
        set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
    endif
    call neobundle#begin(expand('$HOME/.vim/bundle/'))
    let $CONFIG_DIR=$HOME.'/.vim/'
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to instal
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
" original repos on github
NeoBundle 'a.vim'
"NeoBundle 'BlockComment.vim'
NeoBundle 'bufexplorer.zip'
NeoBundle 'c.vim'
"NeoBundle 'comments.vim'
NeoBundle 'genutils'
NeoBundle 'grep.vim'
NeoBundle 'mileszs/ack.vim'
"NeoBundle 'lookupfile'
"NeoBundle 'SuperTab'
NeoBundle 'DrawIt'
NeoBundle 'taglist.vim'
NeoBundle 'TxtBrowser'
"NeoBundle 'Visual-Mark'
NeoBundle 'pythoncomplete'
"NeoBundle 'rkulla/pydiction'
NeoBundle 'unite.vim'
NeoBundle 'FencView.vim'
NeoBundle 'LargeFile'
"NeoBundle 'std_c.zip' " c highlight plugin
"NeoBundle 'after/syntax/c.vim'
NeoBundle 'highlight.vim'
"NeoBundle 'QFixToggle' " jump visiable window for quickfix
NeoBundle 'cmdline-completion' " command auto-complete use c-p and c-n

NeoBundle 'brookhong/cscope.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mbbill/echofunc'
NeoBundle 'adah1972/tellenc'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimshell.vim'

"complete plugins
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
"NeoBundle 'honza/snipmate-snippets'
NeoBundle 'magic-dot-files/TagHighlight' "tag highlight plugin
NeoBundle 'altercation/vim-colors-solarized' "colorscheme
NeoBundle 'tomasr/molokai' "colorscheme
NeoBundle 'rking/ag.vim' "ag search
NeoBundle 'scrooloose/syntastic' "syntax checking plugin
NeoBundle 'godlygeek/tabular' "align text
NeoBundle 'tpope/vim-endwise' "complete certain structures automatically
NeoBundle 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis, brackets, etc.
NeoBundle 'scrooloose/nerdcommenter' "comments
" ctrlp extensions
NeoBundle 'tacahiroy/ctrlp-funky' "function finding
NeoBundle 'sgur/ctrlp-extensions.vim' "cmdline, yankring, menu history
NeoBundle 'acx0/Conque-Shell' " shell
NeoBundle 'Lokaltog/vim-easymotion' " search and jump
NeoBundle 'skydark/fcitx.vim' " linux fcitx
NeoBundle 'PFZheng/Visual-Mark' " fix for Linux Chinese
NeoBundle 'Shougo/vimfiler' " file explorer
NeoBundle 'nathanaelkane/vim-indent-guides' " indent guide
NeoBundle 'sjl/gundo.vim' " gundo
NeoBundle 'michalliu/jsruntime.vim' " js runtime
NeoBundle 'michalliu/jsoncodecs.vim' " json
NeoBundle 'elzr/vim-json' " json synatic
NeoBundle 'michalliu/sourcebeautify.vim' " html source beautify
NeoBundle 'tpope/vim-surround'
NeoBundle "mattn/emmet-vim"
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'
"NeoBundle 'ctrlsf.vim'
NeoBundle 'hail2u/vim-css3-syntax' " CSS syntax
NeoBundle 'othree/html5.vim' " HTML5 syntax
NeoBundle 'pangloss/vim-javascript' " js syntax
"NeoBundle 'jistr/vim-nerdtree-tabs'

"php bundles
"NeoBundle 'StanAngeloff/php.vim'
"NeoBundle 'joonty/vdebug'
"NeoBundle 'shawncplus/phpcomplete.vim'

" some plugins only use in gui
if has("gui_running")
    NeoBundle 'minibufexpl.vim'
    "NeoBundle 'Lokaltog/vim-powerline'
    NeoBundle 'bling/vim-airline'
endif

if has("mac")
    NeoBundle 'msanders/cocoa.vim'
    NeoBundle 'rizzatti/dash.vim'
endif

call neobundle#end()

filetype plugin indent on " required!

" Installation check.
NeoBundleCheck

"Persistent undo
let $undo_dir = $HOME.'/.vimundo'
if finddir($undo_dir) == ''
    silent call mkdir($undo_dir)
endif
set undodir=$HOME/.vimundo
set undofile

"set nocompatibl
set nu
set magic
set ru "标尺信息
set cc=81 "vim 7.3新功能，高亮列
set et " expandtab，用空格代替Tab键
set showcmd
set ai
set sw=4
set ts=4
set sm
set dy=lastline "显示最多行，不用@@
"以上是缩进相关
set backspace=indent,eol,start
sy on
set nobackup
" Search
set ignorecase
set incsearch
set hlsearch
"Don't update while in macro
set lazyredraw
" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=
" Show matching bracet
set showmatch
" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block
" enable omni completion
filetype plugin on
set ofu=syntaxcomplete#Complete
syntax enable
syntax on
set cursorline " highlight current line
set t_Co=256
" fix chinese ime bug in mac
"set noimd
set imsearch=0

" ui
" set default guifont
if has("gui_running")
    " check and determine the gui font after GUIEnter.
    " NOTE: getfontname function only works after GUIEnter.
    winpos 200 100
    if has("gui_macvim")
        set lines=40 columns=90
    else
        set lines=35 columns=75
    endif
    au GUIEnter * call s:SetGuiFont()
endif

" set guifont
function s:SetGuiFont()
    if has("gui_gtk2")
        if getfontname( "Powerline\ Consolas" ) != ""
            let font_name = "Powerline\ Consolas"
        elseif getfontname( "Consolas" ) != ""
            let font_name = "Consolas"
        elseif getfontname( "Droid Sans Mono" ) != ""
            set guifont=Droid\ Sans\ Mono\ 11
        else
            set guifont=Monospace\ 11
        endif
    elseif has("x11")
    " Also for GTK 1
        set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_macvim")
        if getfontname( "Monaco" ) != ""
            set guifont=Monaco:h12
        elseif getfontname( "Consolas" ) != ""
            set guifont=Consolas:h12
        endif
    elseif has("gui_win32")
        let font_name = ""
        " for powerline in windows
        if getfontname( "Powerline\ Consolas" ) != ""
            set guifont=Powerline\ Consolas:h11:cANSI
            let font_name = "Powerline\ Consolas"
        elseif getfontname( "Consolas" ) != ""
            set guifont=Consolas:h11:cANSI " this is the default visual studio font
            let font_name = "Consolas"
        elseif getfontname( "Bitstream_Vera_Sans_Mono" ) != ""
            set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
            let font_name = "Bitstream_Vera_Sans_Mono"
        else
            set guifont=Lucida_Console:h11:cANSI
            let font_name = "Lucida_Console"
        endif
        silent exec "nnoremap <unique> <M-F1> :set guifont=".font_name.":h11:cANSI<CR>"
    endif
endfunction

" color scheme define
if has("gui_running")
    silent exec "colorscheme molokai"
" colorscheme solarized
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"let g:solarized_custom="dark"
"silent exec "colorscheme solarized"
else " if we are in terminal mode
    " NOTE: you cannot use if has('mac') to detect platform in terminal mode.
    silent exec "colorscheme delek"
    " silent exec "colorscheme darkblue"
endif

" save views
au BufWinLeave *.ztx mkview
au BufWinEnter *.ztx silent loadview
au BufNewFile,BufRead *.tx1 setf tx1

" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if has("win32")
    set fileencoding=utf-8
else
    set fileencoding=utf-8
endif

" hide menu and toolbar
if(has("gui_running"))
"处理菜单及右键菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
"source $VIMRUNTIME/mswin.vim
    set guioptions-=m
    set guioptions-=T
    map <silent> <F9> :if &go=~#'m'<Bar>set go-=m<Bar>set go-=T<Bar>else<Bar>set go+=m<Bar>set go+=T<Bar>endif<CR>

" Use CTRL-S for saving, also in Insert mode
"noremap <C-S> :update<CR>
"vnoremap <C-S> :update<CR>
"inoremap <C-S> <C-O>:update<CR>

"复制粘贴快捷键
"noremap <C-A> 1GvG$
"vnoremap <C-A> 1GvG$
"inoremap <C-A> <ESC>1GvG$
"noremap <C-C> "+y
"vnoremap <C-C> "+y
"inoremap <C-C> <ESC>"+y<ESC>
"noremap <C-V> "+P
"vnoremap <C-V> "+P
"inoremap <C-V> <ESC>"+Pi
"

"从ms.vim里粘贴出的快捷键定义
"    vnoremap <C-X> "+x
    "vnoremap <C-C> "+y
    "map <C-V> "+gP
    "cmap <C-V> "+gP
    "exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    "exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
    "noremap <C-S>        :update<CR>
    "vnoremap <C-S>        <C-C>:update<CR>
    "inoremap <C-S>        <C-O>:update<CR>
    "noremap <C-A> gggH<C-O>G<C-O>
    "inoremap <C-A> <C-O>gg<C-O>gH<C-O>G<C-O>
    "cnoremap <C-A> <C-C>gggH<C-O>G<C-O>
    "onoremap <C-A> <C-C>gggH<C-O>G<C-O>
    "snoremap <C-A> <C-C>gggH<C-O>G<C-O>
    "xnoremap <C-A> <C-C>ggVG<C-O>
    source $VIMRUNTIME/mswin.vim 

"处理consle输出乱码
    language messages zh_CN.utf-8
endif

""-----plugin configs------

" ack.vim
if executable('ag')
  let g:ackprg = 'ag '
else
endif

" NERDTree
map <F10> :NERDTreeToggle<CR>
imap <F10> <ESC>:NERDTreeToggle<CR>

" 用空格键来开关折叠（说明西方“"”后面的内容为注释，不会被VIM所识别）
"set foldenable
"set foldmethod=indent
"nnoremap <F4> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


"Latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

"ctags
"set autochdir
set tags=./tags,tags;

"taglist
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
"let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
"let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
"let Tlist_Close_On_Select = 0 " Close the taglist window when a file or tag is selected.
"let Tlist_BackToEditBuffer = 0 " If no close on select, let the user choose back to edit buffer or not
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 30
let Tlist_Compact_Format = 1 " do not show help
let g:winManagerWindowLayout='FileExplorer'
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWidth = 30
nmap wm :WMToggle<cr>
nnoremap <unique> <silent> <F4> :WMToggle<cr>

"let Tlist_WinWidth=50
"au VimEnter * call feedkeys("wm")

"c/h文件切换插件
"nnoremap <silent> <F12> :A<CR>

"grep
"nnoremap <silent> <F3> :Grep<CR>

"cscope
":set cscopequickfix=s-,c-,d-,i-,t-,e-

"QuickFix
"nmap <F6> :cn<cr>
"nmap <F7> :cp<cr>

"补齐
set completeopt=longest,menu

"cscope代码文件夹
"if has("cscope")
" add any database in current directory
"set nocsverb
"if filereadable("cscope.out")
"cs add cscope.out
"elseif filereadable("../cscope.out")
"cs add ../cscope.out
"elseif filereadable("../../cscope.out")
"cs add ../../cscope.out
"elseif filereadable("../../../cscope.out")
"cs add ../../../cscope.out
"elseif filereadable("../../../../cscope.out")
"cs add ../../../../cscope.out
"endif
"set csverb
"set csto=0
"endif

" delimitMate
" let delimitMate_autoclose = 0
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_quotes = "\" ' `"
let delimitMate_excluded_regions = "Comment,String" "This options turns delimitMate off for the listed regions
" let delimitMate_excluded_ft = "mail,txt" "turn off delimitMate for specific files

"txtBrowser
let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
au BufRead,BufNewFile *.txt setlocal ft=txt
au BufRead,BufNewFile *.log setlocal ft=txt


" lookupfile setting
"let g:LookupFile_MinPatLength = 2 "最少输入2个字符才开始查找
"let g:LookupFile_PreserveLastPattern = 0 "不保存上次查找的字符串
"let g:LookupFile_PreservePatternHistory = 1 "保存查找历史
"let g:LookupFile_AlwaysAcceptFirst = 1 "回车打开第一个匹配项目
"let g:LookupFile_AllowNewFiles = 0 "不允许创建不存在的文件
""映射LookupFile为,lk
"nmap <silent> lk :LUTags<cr>
""映射LUBufs为,ll
"nmap <silent> ll :LUBufs<cr>
""映射LUWalk为,lw
"nmap <silent> lw :LUWalk<cr>


" NeoComplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
" Disable auto complete
let g:neocomplete#disable_auto_complete = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 0
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#manual_completion_start_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g> neocomplete#undo_completion()
"inoremap <expr><C-l> neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"" For no inserting <CR> key.
""return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ neocomplete#start_manual_complete()
"function! s:check_back_space() "{{{
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1] =~ '\s'
"endfunction "}}}
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y> neocomplete#close_popup()
"inoremap <expr><C-e> neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left> neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up> neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down> neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" tagbar
let g:tagbar_right = 1
let g:tagbar_width = 35
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 0
let g:tagbar_singleclick = 0
nmap <F8> :TagbarToggle<CR>

" split buffer windows
nmap ws :split<cr>
nmap wv :vsplit<cr>
nmap wq :close<cr>

" move between windows with Alt+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" powerline
"set laststatus=2
"set t_Co=256
""let g:Powerline_symbols = 'unicode'
"let g:Powerline_dividers_override = ['', '>', '', '<']
"let g:Powerline_symbols_override = {
    "\ 'BRANCH': '⭠',
    "\ 'LINE': '⭡',
    "\ 'RO' : '⭤',
    "\ }
"let g:Powerline_mode_V = 'V·LINE'
"let g:Powerline_mode_cv = 'V·BLOCK'
"let g:Powerline_mode_S = 'S·LINE'
"let g:Powerline_mode_cs = 'S·BLOCK'

"" vim-airline
set laststatus=2
let g:airline_theme = 'molokai'
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
"let g:airline_powerline_fonts = 1
" vim-powerline like symbols
"let g:airline_left_sep = '>'
"let g:airline_right_sep = '<'
if has("mac")
    let g:airline_branch_prefix = '¶'
    let g:airline_readonly_symbol = 'R'
    let g:airline_linecolumn_prefix = '␤'
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
else
    let g:airline_branch_prefix = 'B'
    let g:airline_readonly_symbol = 'R'
    let g:airline_linecolumn_prefix = 'LN'
    let g:airline_left_sep = '|'
    let g:airline_left_sep = '|'
    let g:airline_right_sep = '|'
    let g:airline_right_sep = '|'
endif
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_mode_map = {
"\ '__' : '',
"\ }
"let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_filenames = ['-MiniBufExplorer-','__Tagbar__']
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#default#layout = [
\ [ 'a', 'b', 'c' ],
\ [ 'x', 'y', 'z']
\ ]

"MiniBufExplorer
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

"std_c
"let c_c_vim_compatible = 1
"let c_C99 = 1
"let c_ansi_typedefs = 1
"let c_ansi_constants = 1
"let c_posix = 1
"let c_math = 1
"let c_gnu = 1
"let c_comment_types = 1
"let c_syntax_for_h = 1

" open vimgrep, search in current file, and store in quickfix windows
map ,r :vimgrep /\<<c-r><c-w>\>/j
map ,R "ay:vimgrep /\<<c-r>a\>/j
let Grep_Skip_Files = '*.bak *.swp tags' 
 
function! QFixToggle(force)
    if exists("g:qfix_win")
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

" toggle for quickfix
nmap <silent> <F4> :call QFixToggle(0)<CR>

"NERDCommenter
vmap <leader>b <plug>NERDCommenterNested
nmap <leader>b <plug>NERDCommenterNested
"imap <c-b> <ESC><c-b>i
vmap <leader>u <plug>NERDCommenterUncomment
nmap <leader>u <plug>NERDCommenterUncomment
"imap <c-u> <ESC><c-u>i

" CtrlP
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" searching by filename, use <c-d> to switch between filename and full path
" let g:ctrlp_by_filename = 1
" user defined root markers
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:100'
let g:ctrlp_root_markers = ['.ctrlp', '.git', '.svn', '.hg', '.bzr',
    \ '_darcs', '_svn', 'README']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_regexp = 1
" follow symbol links
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['funky','cmdline','menu']
let g:ctrlp_max_files = 100000
" keymap
nnoremap <Space>p :CtrlP<Cr>
nnoremap <Space>e :CtrlPBuffer<Cr>
nnoremap <Space>] :CtrlPTag<Cr>
nnoremap <Space>t :CtrlPBufTagAll<Cr>
nnoremap <Space>T :CtrlPBufTag<Cr>
nnoremap <Space>q :CtrlPQuickfix<Cr>
nnoremap <Space>d :CtrlPDir<Cr>
nnoremap <Space>r :CtrlPRTS<Cr>
nnoremap <Space>u :CtrlPUndo<Cr>
nnoremap <Space>l :CtrlPLine<Cr>
nnoremap <Space>c :CtrlPChange<Cr>
nnoremap <Space>C :CtrlPChangeAll<Cr>
nnoremap <Space>m :CtrlPMixed<Cr>
nnoremap <Space>b :CtrlPBookmarkDir<Cr>
nnoremap <Space>B :CtrlPBookmarkDirAdd<Cr>
nnoremap <Space>f :CtrlPFunky<Cr>
nnoremap <Space>F :execute 'CtrlPFunky '.expand('<cword>')<Cr>

" VimFiler
let g:vimfiler_as_default_explorer = 1

" syntastic
"let g:syntastic_mode_map = { 'mode': 'active',
                           "\ 'active_filetypes': ['python', 'ruby', 'php'],
                           "\ 'passive_filetypes': ['cpp'] }

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']

" pydict
" let g:pydiction_location = $CONFIG_DIR.'/bundle/Pydiction/complete-dict'

" largefile
let g:LargeFile = 30

" gundo
nnoremap <F6> :GundoToggle<CR>
"let g:gundo_width = 60
"let g:gundo_preview_height = 40
let g:gundo_right = 1

" js beautifier
map <c-l> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-l> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-l> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-l> :call CSSBeautify()<cr>

" tagbar
if (has("mac"))
    let g:tagbar_type_objc = {
      \ 'ctagstype': 'objc',
      \ 'ctagsargs': [
        \ '-f',
        \ '-',
        \ '--excmd=pattern',
        \ '--extra=',
        \ '--format=2',
        \ '--fields=nksaSmt',
        \ '--options=' . expand('~/.objctags'),
        \ '--objc-kinds=-N',
      \ ],
      \ 'sro': ' ',
      \ 'kinds': [
        \ 'c:constant',
        \ 'e:enum',
        \ 't:typedef',
        \ 'i:interface',
        \ 'P:protocol',
        \ 'p:property',
        \ 'I:implementation',
        \ 'M:method',
        \ 'g:pragma',
      \ ],
    \ }
endif

" PHP.vim
"let g:php_syntax_extensions_enabled = 1
"let b:php_syntax_extensions_enabled = 1

"function! PhpSyntaxOverride()
  "hi! def link phpDocTags  phpDefine
  "hi! def link phpDocParam phpType
"endfunction

"augroup phpSyntaxOverride
  "autocmd!
  "autocmd FileType php call PhpSyntaxOverride()
"augroup END

"vdebug
let g:vdebug_options= {
    \    "port" : 9001,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : 'php-xdebug',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}

"ultisnips
let g:UltiSnipsEditSplit="vertical"

"YouCompleteMe
let g:ycm_global_ycm_extra_conf=$CONFIG_DIR.'/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 0

" Visual-Mark
map <unique> <F5> <Plug>Vm_goto_next_sign
map <unique> <s-F5> <Plug>Vm_goto_prev_sign

" virsual arrow map
vmap <UP> k
vmap <LEFT> h
vmap <RIGHT> l
vmap <DOWN> j
