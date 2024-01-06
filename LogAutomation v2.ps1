# ログ保存フォルダを指定
$LOGFILE_PATH = "${ログ保存フォルダ}"

$BEFORE_LOGFILENAME = (Get-Date -Format "yyyy-MM-dd") + " before_name.txt"

Write-Host "クリップボードの内容を保存します。"
# 一旦 $BEFORE_LOGFILENAME.txt として保存
Get-Clipboard | Set-Content -Path "$LOGFILE_PATH\$BEFORE_LOGFILENAME"

$FILE_NAME = Read-Host "命名するファイル名を入力してください"
# 「yyyy-mm-dd ファイル名.txt」を設定
$LOGFILE_NAME = (Get-Date -Format "yyyy-MM-dd") + " $FILE_NAME.txt"

$FILE_NUM = 1
$count = 0
Set-Location $LOGFILE_PATH

# すでに同じファイル名が存在していないかを確認 存在しているのであれば「ファイル名_数字.txt」の形式で保存するように訂正
while ((Test-Path $LOGFILE_NAME) -eq $true) {
    $FILE_NUM += 1
    $LOGFILE_NAME = (Get-Date -Format "yyyy-MM-dd") + " ${FILE_NAME}_${FILE_NUM}.txt"
    $count += 1
}

if ($count -ne 0) {
    $FILE_NAME += "_$FILE_NUM"
}

Rename-Item "$LOGFILE_PATH\$BEFORE_LOGFILENAME" $LOGFILE_NAME

if (Test-Path $LOGFILE_NAME) {
    Write-Host ""
    Write-Host "ログ保存が完了しました。"
    Write-Host "ファイル名：$LOGFILE_NAME"

    # 保存終了後、保存フォルダを開く
    Invoke-Item "$LOGFILE_PATH"

    Write-Host ""
} else {
    Write-Host ""
    Write-Host "指定したファイル名での保存に失敗しました。ファイル名に使用できない文字が含まれていないか確認してください。" 
    Write-Host ""
}

Write-Host "5秒後終了します。"
Start-Sleep -Seconds 5