" カラースキーマ
if has('gui')
		"gvim
		colorscheme murphy
	else
		"vim
		colorscheme default
endif

" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

"挿入モード時にIMEデフォルトOFF
set iminsert=0
set imsearch=-1

" クリップボードからペースト
set guioptions+=ab
syntax on

"キーマップ
nnoremap <F2> :q!<ENTER>

set number nobackup si nowrap ru wa
set shiftwidth=4
set tabstop=4
set selectmode+=mouse
set guioptions+=ab
set clipboard+=unnamed
set grepprg=internal
set hlsearch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルのファイルの先頭へループしない
set nowrapscan
map <C-t>  :tabnew<Enter>
map <F4>  :vim /\<package\>/j **/*.java
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"検索後のハイライトを消す
nmap <ESC><ESC> :nohlsearch <Enter>
":grep や :make の実行後、自動的に QuickFix ウィンドウを開く
au QuickfixCmdPost make,grep,grepadd,vimgrep copen
au QuickfixCmdPost l* lopen

set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"ノーマルモードの<C-^>を無効化
nnoremap <silent> <C-^> <Nop>

" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
"フォント設定
set guifont=Osaka−等幅:h13

set nocompatible
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
filetype plugin indent on     " required!

" ノーマルモード時imeオフ
set imdisable

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" Note: Skip initialization for vim-tiny or vim-small.
  if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

        " Required:
         set runtimepath+=~/.vim/bundle/neobundle.vim/

          " Required:
           call neobundle#begin(expand('~/.vim/bundle/'))

            " Let NeoBundle manage NeoBundle
             " Required:
              NeoBundleFetch 'Shougo/neobundle.vim'

               " My Bundles here:
                " Refer to |:NeoBundle-examples|.
                 " Note: You don't set neobundle setting in .gvimrc!

                  call neobundle#end()

                   " Required:
                    filetype plugin indent on

                     " If there are uninstalled bundles found on startup,
                      " this will conveniently prompt you to install them.
                       NeoBundleCheck

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'
filetype plugin indent on
