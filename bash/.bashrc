# ==========================================
# 基本操作
# ==========================================
# cdコマンド
alias ..='cd ..'
alias ...='cd ../..'

# 画面をクリア
alias c='clear'

# ==========================================
# lsコマンド
# ==========================================
# 日時表示を ISO形式 (YYYY-MM-DD HH:MM) に統一
export TIME_STYLE=long-iso

# ll: 隠しファイルを含む詳細表示
#  -a: 隠しファイルを表示
#  -l: 詳細リスト形式
#  -h: サイズを読みやすく (KB, MBなど)
#  -F: 種類判別マーク付与 (/はフォルダ、*は実行ファイル)
#  --group-directories-first: フォルダを先に表示
alias ll='ls -lahF --group-directories-first'

# lt: 更新日時順に表示 (最新ファイルが一番下に来る)
#  -t: 時間順
#  -r: 逆順 (最新を末尾へ)
alias lt='ls -ltrh'

# lk: ファイルサイズ順に表示 (大きいファイルが一番下に来る)
#  -S: サイズ順
#  -r: 逆順 (大きいものを末尾へ)
alias lk='ls -lSrh'

# ==========================================
# 移動コマンド
# ==========================================
# Visual Studio Code ワークスペースのルートへ移動
ws() {
    if [ -n "$WSROOT" ]; then
        cd "$WSROOT"
    else
        echo "WSROOT is not set."
    fi
}

# Downloadsディレクトリへ移動
alias dl='cd ~/Downloads'

# Screenshotsディレクトリへ移動
alias ss='cd ~/Pictures/Screenshots'

# ==========================================
# エクスプローラー
# ==========================================
# カレントディレクトリをWindowsのエクスプローラーで開く
alias e='explorer.exe .'

# ごみ箱をWindowsのエクスプローラーで開く
alias trash='explorer.exe shell:RecycleBinFolder'