" カラースキーマ
colorscheme murphy

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

