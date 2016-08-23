" neobundle

if 0 | endif

if has('vim_starting')
  set number
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
  let g:neobundle_default_git_protocol='https'
endif

call neobundle#begin(expand('~/.vim.bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'fatih/vim-go'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

source ~/.vim/plugin/encode.vim

" 256 colors
set t_Co=256

" mouse support
set mouse=a

" vim-airline
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" unite
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" set editor style{{{
syntax on
filetype on
filetype indent on
filetype plugin on
"set tabstop=4
"set shiftwidth=4
set autoindent
set noswapfile
set nobackup
set backspace=eol,indent,start
set ignorecase
set smartcase
set incsearch

set expandtab
set tabstop=8
set shiftwidth=2
set softtabstop=2
set guifont=Ricty\ 12
set hlsearch
" }}}

""set fenc=utf-8
""" 文字コードの自動認識
""if &encoding !=# 'utf-8'
""  set encoding=japan
""  set fileencoding=japan
""endif
""
""if has('iconv')
""  let s:enc_euc = 'euc-jp'
""  let s:enc_jis = 'iso-2022-jp'
""  " iconvがeucJP-msに対応しているかをチェック
""  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
""    let s:enc_euc = 'eucjp-ms'
""    let s:enc_jis = 'iso-2022-jp-3'
""  " iconvがJISX0213に対応しているかをチェック
""  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
""    let s:enc_euc = 'euc-jisx0213'
""    let s:enc_jis = 'iso-2022-jp-3'
""  endif
""  " fileencodingsを構築
""  if &encoding ==# 'utf-8'
""    let s:fileencodings_default = &fileencodings
""    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
""    let &fileencodings = &fileencodings .','. s:fileencodings_default
""    unlet s:fileencodings_default
""  else
""    let &fileencodings = &fileencodings .','. s:enc_jis
""    set fileencodings+=utf-8,ucs-2le,ucs-2
""    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
""      set fileencodings+=cp932
""      set fileencodings-=euc-jp
""      set fileencodings-=euc-jisx0213
""      set fileencodings-=eucjp-ms
""      let &encoding = s:enc_euc
""      let &fileencoding = s:enc_euc
""    else
""      let &fileencodings = &fileencodings .','. s:enc_euc
""    endif
""  endif
""  " 定数を処分
""  unlet s:enc_euc
""  unlet s:enc_jis
""endif
"""
""" 日本語を含まない場合は fileencoding に encoding を使うようにする
""if has('autocmd')
""  function! AU_ReCheck_FENC()
""    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
""      let &fileencoding=&encoding
""    endif
""  endfunction
""  autocmd BufReadPost * call AU_ReCheck_FENC()
""endif
"""
""" 改行コードの自動認識
""set fileformats=unix,dos,mac
""" □とか○の文字があってもカーソル位置がずれないようにする
""if exists('&ambiwidth')
""  set ambiwidth=double
""endif

" quoting auto complete {{{
	inoremap	{	{}<LEFT>
	inoremap	[	[]<LEFT>
	inoremap	(	()<LEFT>
	inoremap	"	""<LEFT>
	inoremap	'	''<LEFT>
	vnoremap	{	"zdi{<C-R>z}<ESC>
	vnoremap	[	"zdi[<C-R>z]<ESC>
	vnoremap	(	"zdi(<C-R>z)<ESC>
	vnoremap	"	"zdi"<C-R>z"<ESC>
	vnoremap	'	"zdi'<C-R>z'<ESC>
        nmap            <LEFT>  <ESC>
        imap            <LEFT>  <ESC>
        nmap            <RIGHT>  <ESC>
        imap            <RIGHT>  <ESC>
        nmap            <UP>  <ESC>
        imap            <UP>  <ESC>
        nmap            <DOWN>  <ESC>
        imap            <DOWN>  <ESC>
"}}}

" buffer change shortcut {{{
	map		<F2>	<ESC>:bp<CR>
	map		<F3>	<ESC>:bn<CR>
" }}}

" smartchr {{{
"  inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' => ', ' === ', '=')
"  inoremap <buffer><expr> + smartchr#loop(' + ', ' ++ ', '+')
"  inoremap <buffer><expr> - smartchr#loop(' - ', ' -- ', '-')
"  inoremap <buffer><expr> * smartchr#loop(' * ', ' ** ', '*')
"  inoremap <buffer><expr> } smartchr#loop('}', '}<CR>')
"  inoremap <buffer><expr> ; smartchr#loop(';', ';<CR>')
"  inoremap <buffer><expr> , smartchr#loop(', ', ',')
" }}}

" neocomplcache {{{
"  let g:neocomplcache_enable_at_startup = 1
"  let g:neocomplcache_enable_smart_case = 1
"  let g:neocomplcache_enable_camel_case_completion = 1
"  let g:neocomplcache_enable_underbar_completion = 1
"  let g:neocomplcache_min_syntax_length = 3
" }}}


" QuickFix hook {{{
autocmd QuickFixCmdPost *grep* cwindow
" }}}

" change encoding {{{
command! Cp932		edit ++enc=cp932
command! Eucjp		edit ++enc=euc-jp
command! Iso2022jp	edit ++enc=iso-2022-jp
command! Utf8		edit ++enc=utf-8
command! Jis		Iso2022jp
command! Sjis		Cp932
" }}}

" set colorscheme {{{
colorscheme hhdgreen
" }}}

" complete {{{
set completeopt=menu,preview,longest
aug Complete
	au!
	au FileType python			setl omnifunc=pythoncomplete#Complete
	au FileType javascript		setl omnifunc=javascriptcomplete#Complete
	au FileType html			setl omnifunc=htmlcomplete#CompleteTags
	au FileType css 			setl omnifunc=csscomplete#CompleteCSS
	au FileType xml				setl omnifunc=xmlcomplete#CompleteTags
	au FileType php 			setl omnifunc=phpcomplete#CompletePHP
	au FileType c	 			setl omnifunc=ccomplete#Complete
aug END
set complete+=k
" }}}

" vim shortcut settings(all mode){{{
        nnoremap ;                              :
        nnoremap :                              ;
        nnoremap <C-s>                          :split<Return>
        nnoremap <C-s>v                         :vsplit<Return>
        nnoremap qw                             <C-w>c
	nnoremap <C-h>				:<C-u>help<Space>
	nnoremap <C-h><C-h>			:<C-u>help<Space><C-r><C-w><Return>
	nnoremap <Space>.			:<C-u>edit $HOME/\.vimrc<Return>
	nnoremap <Space>s.			:<C-u>source $HOME/\.vimrc<Return>
        nnoremap nd                             :NERDTreeToggle<Return>
	noremap j					gj
	noremap k					gk
	noremap gj					j
	noremap gk					k
        noremap gy                                       "+y
        noremap gp                                       "+gp
        noremap gx                                       "+x

" Rails Setting{{{
        nnoremap rc  :Rcontroller<Space>
        nnoremap rm  :Rmodel<Space>
        nnoremap rv  :Rview<Space>
        nnoremap rl  :Rlayout<Space>
        nnoremap rs  :Rspec<Space>
        nnoremap rf  :Rfixtures<Space>
" }}}

" for ruby{{{
au BufEnter *.rb				call RubyEnvironment()
au BufEnter *.erb				call RubyEnvironment()
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
function! RubyEnvironment()
"  let g:rails_level=4
"  let g:rails_default_file="app/controllers/application.rb"
  let g:rubycomplete_buffer_loading=1
  let g:rubycomplete_rails=1
  setl omnifunc=rubycomplete#Complete
  set dictionary=$HOME/ruby.dict
  let g:rubycomplete_classes_in_global=1
  let g:rubycomplete_include_object=13
  let g:rubycomplete_include_objectspace=1

  " add comment block
  if exists('b:rails_cached_file_type') == 1
    if b:rails_cached_file_type == "test-unit" 
      map <F5>	:!ruby "%"<Return>
    elseif b:rails_cached_file_type == "-"
      map <F5>	:!ruby "%"<Return>
    else
      map <F5>	:Rpreview<Return>
    endif
  else
    map <F5>	:!ruby "%"<Return>
  endif
endf
" }}}
