" =========================================
" 一般
" =========================================

" 上書き前のバックアップファイルの作成を無効化
set nobackup
set nowritebackup

" スワップファイルの作成を無効化
set noswapfile

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" Windowsでのパス区切り文字をスラッシュで扱う
set shellslash

" yankでクリップボードにコピー
set clipboard=unnamed,autoselect

" 数の増減など => 10進数
set nrformats=

" カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,],~

" マウス有効化
set mouse=a

" Vimの内部文字コード => UTF-8
set encoding=utf-8

" ファイル書き込み時の文字コード => UTF-8 (fenc => fileencodingの略)
set fenc=utf-8

" ファイル読み込み時のエンコード => UTF-8 -> Shift-JIS(cp932) -> EUS-JP
set fileencodings=utf-8,cp932,euc-jp

" 改行コード判定
set fileformats=unix,dos,mac

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるようにする
set hidden

" 行末の1字先までカーソルを移動できるようにする
set virtualedit=onemore

" =========================================
" 画面表示
" =========================================

" シンタックスハイライト有効化
syntax on

" タイトル表示
set title

" 行番号を表示
set number

" 全角文字設定 (全角記号などの表示を正しく表示させるための設定)
set ambiwidth=double

" 対応する括弧やブレースを表示
set showmatch
set matchtime=1

" インデント方法の変更
set cinoptions+=:0

" メッセージ表示欄を2行確保
set cmdheight=2

" ステータス行を表示
set laststatus=2

" 入力中コマンド表示
set showcmd

" 一行も文字数が多くても省略せずに表示
set display=lastline

" 不可視文字を表示
set list
" 不可視文字設定
" タブ                 [tab]   : »-
" 行末スペース         [trail] : ･
" ノーブレークスペース [nbsp]  : %
" 改行                 [eol]   : ↲
set listchars=tab:»-,trail:･,nbsp:%,eol:↲

" コメント色 => 水色
hi Comment ctermfg=DarkCyan

" インデント幅
set shiftwidth=2

" Tabキー押下時のインデント幅
set softtabstop=2

" タブ表示幅
set tabstop=2

" 改行時のインデント
" 前行と同じインデントを挿入
set autoindent
" ブロックに応じてインデントを調整
set smartindent

" 行頭でTab => インデント挿入
set smarttab

" 現在の行をハイライト
set cursorline
" set cursorcolumn

" ビープ音を可視化 => beep音を停めて画面の点滅もさせない
set visualbell t_vb=

" カーソルの見た目を変更
" Insert Mode  => 縦棒 - 点滅
" Normal Mode  => ブロック - 点滅
" Replace Mode => アンダーライン - 点滅
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"
let &t_SR .= "\e[3 q"

" =========================================
" GUI
" =========================================

" ツールバーを非表示
set guioptions-=T

" yankをした時にクリップボードへ
set guioptions+=a

" メニューバーを非表示
set guioptions-=m

" 右スクロールバーを非表示
set guioptions+=R

" =========================================
" Command Line
" =========================================

" wildmenuオプションを有効化 (ファイル名補完)
set wildmenu
set wildmode=list:longest

" コマンドライン履歴 => 10,000件保存
set history=10000

" =========================================
" Normal Mode
" =========================================

" Key Mapping -----------------------------

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" 理論行･表示行移動の再マッピング
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap <down> gj
nnoremap <up> gk

" =========================================
" Insert Mode
" =========================================

" BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" Tab => 半角スペース挿入
set expandtab

" Key Mapping -----------------------------

" jjでEsc
inoremap <silent> jj <ESC>

" =========================================
" Visual Mode
" =========================================

" 矩形選択 --------------------------------

" 文字が無くても右へ進めるように設定
set virtualedit=block

" =========================================
" 検索
" =========================================

" 検索文字区別
" 検索文字 : 小文字 => 大文字･小文字を無視する
" 検索文字 : 大文字 => 大文字･小文字を無視しない
set ignorecase
set smartcase

" 検索が末尾まで進む => 先頭から再度検索
set wrapscan

" インクリメンタル検索 (検索文字を入力した時点から検索開始)
set incsearch

" 検索結果をハイライト
set hlsearch

" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable

