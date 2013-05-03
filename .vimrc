if has ("win32")
    let $HOME='D:/Vim'
    let g:tagbar_ctags_bin=$HOME.'/vim73/ctags.exe'
    "let g:neocomplcache_ctags_program=$HOME.'/vim73/ctags.exe'
    let g:tagbar_systemenc = 'GBK'
endif

"设置neobundle
set nocompatible               " be iMproved

if has ("win32")
	if has('vim_starting')
        set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
    endif
    call neobundle#rc(expand('$HOME/vimfiles/bundle/'))
else
    if has('vim_starting')
        set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
    endif
    call neobundle#rc(expand('$HOME/.vim/bundle/'))
endif


" let bundle manage bundle
" required! 
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
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
NeoBundle 'lookupfile'
NeoBundle 'SuperTab'
NeoBundle 'taglist.vim'
NeoBundle 'TxtBrowser'
"NeoBundle 'Visual-Mark'
NeoBundle 'pythoncomplete'
NeoBundle 'Pydiction'
NeoBundle 'unite.vim'
NeoBundle 'FencView.vim'
"NeoBundle 'std_c.zip' " c highlight plugin
"NeoBundle 'after/syntax/c.vim'
NeoBundle 'highlight.vim'
"NeoBundle 'QFixToggle' " jump visiable window for quickfix
NeoBundle 'cmdline-completion' " command auto-complete use c-p and c-n

NeoBundle 'brookhong/cscope.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mbbill/echofunc'
NeoBundle 'adah1972/tellenc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
"NeoBundle 'honza/snipmate-snippets'
NeoBundle 'magic-dot-files/TagHighlight' "tag highlight plugin
NeoBundle 'altercation/vim-colors-solarized' "colorscheme
NeoBundle 'tomasr/molokai' "colorscheme
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
NeoBundle 'cnbirdfly/Visual-Mark' " fix for Linux Chinese
NeoBundle 'Shougo/vimfiler' " file explorer
NeoBundle 'nathanaelkane/vim-indent-guides' " indent guide

" some plugins only use in gui
if has("gui_running")
    NeoBundle 'minibufexpl.vim'
    NeoBundle 'Lokaltog/vim-powerline'
endif

filetype plugin indent on     " required!

" Installation check.
NeoBundleCheck

"Persistent undo
let $undo_dir = $HOME.'/.vimundo'
if finddir($undo_dir) == ''
    silent call mkdir($undo_dir)
endif
set undodir=$HOME/.vimundo
set undofile

"set nocompatible
set nu
set magic
set ru "标尺信息
"set cc=81 "vim 7.3新功能，高亮列
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

"tab mappings
"map <C-1> 1gt
"map <C-2> 2gt
"map <C-3> 3gt
"map <C-4> 4gt
"map <C-5> 5gt
"map <C-6> 6gt
"map <C-7> 7gt
"map <C-8> 8gt
"map <C-9> 9gt
"map <C-t> :tabnew<CR>
"map <C-w> :tabclose<CR>
"map! <C-1> <esc>1gt
"map! <C-2> <esc>2gt
"map! <C-3> <esc>3gt
"map! <C-4> <esc>4gt
"map! <C-5> <esc>5gt
"map! <c-6> <esc>6gt
"map! <C-7> <esc>7gt
"map! <C-8> <esc>8gt
"map! <C-9> <esc>9gt
"map! <C-t> <esc>:tabnew<CR>
"map! <C-w> <esc>:tabclose<CR>

" ui
" set default guifont
if has("gui_running")
    " check and determine the gui font after GUIEnter. 
    " NOTE: getfontname function only works after GUIEnter.
    "启动窗口设置
    winpos 200 100
    set lines=35 columns=75
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
    elseif has("mac")
        if getfontname( "Bitstream_Vera_Sans_Mono" ) != ""
            set guifont=Bitstream\ Vera\ Sans\ Mono:h11
        elseif getfontname( "DejaVu\ Sans\ Mono" ) != ""
            set guifont=DejaVu\ Sans\ Mono:h11
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
    " silent exec "colorscheme ex"
    " silent exec "colorscheme evening"
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

"2006-09-13 如下：保存视图
au BufWinLeave *.ztx mkview
au BufWinEnter *.ztx silent loadview
au BufNewFile,BufRead *.tx1 setf tx1

"==== F3 NERDTree 切换
"map <F3> :NERDTreeToggle<CR>
"imap <F3> <ESC>:NERDTreeToggle<CR>

"编码
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if has("win32")
    set fileencoding=utf-8
else
    set fileencoding=utf-8
endif

"默认隐藏菜单和工具栏
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
    vnoremap <C-X> "+x
    vnoremap <C-C> "+y
    map <C-V> "+gP
    cmap <C-V> "+gP
    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
    noremap <C-S>		:update<CR>
    vnoremap <C-S>		<C-C>:update<CR>
    inoremap <C-S>		<C-O>:update<CR>
    noremap <C-A> gggH<C-O>G
    inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
    cnoremap <C-A> <C-C>gggH<C-O>G
    onoremap <C-A> <C-C>gggH<C-O>G
    snoremap <C-A> <C-C>gggH<C-O>G
    xnoremap <C-A> <C-C>ggVG

    "处理consle输出乱码
    language messages zh_CN.utf-8
endif

"用空格键来开关折叠（说明西方“"”后面的内容为注释，不会被VIM所识别）
"set foldenable
"set foldmethod=indent
"nnoremap <F4> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


"Latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on


" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

"ctags
set autochdir
set tags=tags;

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
nnoremap <silent> <F12> :A<CR>

"grep
nnoremap <silent> <F3> :Grep<CR>

"cscope
":set cscopequickfix=s-,c-,d-,i-,t-,e-

"QuickFix
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

"补齐
set completeopt=longest,menu

"cscope代码文件夹
":cs add E:\private\Windows_via_C\cscope.out E:\private\Windows_via_C
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


"括号自动补齐
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
":inoremap " ""<ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

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


""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
"let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
"let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
"let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
"let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"映射LookupFile为,lk
"nmap <silent> lk :LUTags<cr>
"映射LUBufs为,ll
"nmap <silent> ll :LUBufs<cr>
"映射LUWalk为,lw
"nmap <silent> lw :LUWalk<cr>

"补齐插件
"neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0
let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1 "支持下划线分割的关键词
let g:neocomplcache_enable_quick_match = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_ctags_program = "ctags"
let g:neocomplcache_force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"supertab 
let g:SuperTabDefaultCompletionType = '<C-X><C-U>' "SuperTab调用
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabRetainCompletionType=2

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
if has ("win32")
    let g:neosnippet#snippets_directory=$HOME.'/vimfiles/bundle/snipmate-snippets/snippets'
else
    let g:neosnippet#snippets_directory=$HOME.'/.vim/bundle/snipmate-snippets/snippets'
endif

"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" omni patterns
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" tagbar
let g:tagbar_left = 1
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
set laststatus=2
"set t_Co=256 
"let g:Powerline_symbols = 'unicode' 

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

" 连续的进行visual模式移动
vnoremap < <gv
vnoremap > >gv

"NERDCommenter
vmap <c-b> <plug>NERDCommenterNested
nmap <c-b> <plug>NERDCommenterNested
imap <c-b> <ESC><c-b>i
imap <c-u> <plug>NERDCommenterUncomment
vmap <c-u> <plug>NERDCommenterUncomment
nmap <c-u> <plug>NERDCommenterUncomment
imap <c-u> <ESC><c-u>i

" CtrlP
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" searching by filename, use <c-d> to switch between filename and full path
" let g:ctrlp_by_filename = 1
" user defined root markers
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_open_new_file = 'r'
" follow symbol links
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['funky','cmdline','menu']
" keymap
nnoremap <Space>p :CtrlP<Cr>
nnoremap <Space>] :CtrlPTag<Cr>
nnoremap <Space>t :CtrlPBufTag<Cr>
nnoremap <Space>T :CtrlPBufTagAll<Cr>
nnoremap <Space>q :CtrlPQuickfix<Cr>
nnoremap <Space>d :CtrlPDir 
nnoremap <Space>r :CtrlPRTS<Cr>
nnoremap <Space>u :CtrlPUndo<Cr>
nnoremap <Space>l :CtrlPLine<Cr>
nnoremap <Space>c :CtrlPChange<Cr>
nnoremap <Space>C :CtrlPChangeAll<Cr>
nnoremap <Space>m :CtrlPMixed<Cr>
nnoremap <Space>b :CtrlPBookmarkDir<Cr>
nnoremap <Space>B :CtrlPBookmarkDirAdd 
nnoremap <Space>f :CtrlPFunky<Cr>
nnoremap <Space>F :execute 'CtrlPFunky '.expand('<cword>')<Cr>

" VimFiler
let g:vimfiler_as_default_explorer = 1

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']

