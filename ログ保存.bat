@echo off
setlocal

rem ログ保存フォルダを指定
set LOGFILE_PATH="<ログ保存フォルダ>"

set BEFORE_LOGFILENAME=%date:/=-%" "before_name.txt

echo クリップボードの内容を保存します。
powershell -command get-clipboard > %LOGFILE_PATH%\%BEFORE_LOGFILENAME%

set /p FILE_NAME="付けたいファイル名を入力してください："
rem 「yyyy-mm-dd ファイル名.txt」を設定
set LOGFILE_NAME=%date:/=-%" "%FILE_NAME%.txt

cd %LOGFILE_PATH%
ren %BEFORE_LOGFILENAME% %LOGFILE_NAME%

if exist %LOGFILE_NAME% (
	echo;
	echo ログ保存が完了しました。
	echo ファイル名：%date:/=-% %FILE_NAME%.txt
	echo;
) else (
	echo;
	echo ファイル名に使用できない文字が含まれています。
	echo;
)

echo 5秒後終了します。
timeout /t 5

endlocal
