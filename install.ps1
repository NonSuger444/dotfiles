# dotfilesのルートパス
$dotfilesDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

Write-Host "Installing dotfiles from $dotfilesDir"

function New-SymbolicLink {
    param (
        [string]$src,
        [string]$target
    )

    # 既にファイルが存在する場合の処理
    if (Test-Path $target) {
        # シンボリックリンクが既に存在するか確認
        if((Get-Item $target).LinkType -eq "SymbolicLink") {
            # シンボリックリンクが既に存在する場合はスキップ
            Write-Host "Symbolic link already exists at $target, skipping."
            return
        }
        # 既存のファイルをバックアップ
        $backupPath = "$target.bak"
        Write-Host "Backing up existing file at $target to $backupPath"
        Move-Item $target -Destination $backupPath -Force
    }
    # シンボリックリンクを作成
    Write-Host "Creating symbolic link from $src to $target"
    New-Item -ItemType SymbolicLink -Path $target -Target $src
}

# Bash設定
New-SymbolicLink "$dotfilesDir\bash\.bashrc" "$HOME\.bashrc"
New-SymbolicLink "$dotfilesDir\bash\.bash_profile" "$HOME\.bash_profile"

# Neovim設定
New-SymbolicLink "$dotfilesDir\nvim" "$HOME\AppData\Local\nvim"

Write-Host "Done!"
