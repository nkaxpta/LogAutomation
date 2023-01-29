@echo off
setlocal enabledelayedexpansion

rem ログ保存フォルダを指定
set LOGFILE_PATH="<ログ保存フォルダ>"

set BEFORE_LOGFILENAME=%date:/=-%" "before_name.txt

echo クリップボードの内容を保存します。
powershell -command get-clipboard > %LOGFILE_PATH%\%BEFORE_LOGFILENAME%

set /p FILE_NAME="付けたいファイル名を入力してください："
rem 「yyyy-mm-dd ファイル名.txt」を設定
set LOGFILE_NAME=%date:/=-%" "%FILE_NAME%.txt

set FILE_NUM=1
set count=0
cd %LOGFILE_PATH%

:name-define
if exist %LOGFILE_NAME% (
	set /a FILE_NUM+=1
	set LOGFILE_NAME=%date:/=-%" "%FILE_NAME%_!FILE_NUM!.txt
	set /a count+=1
) else (
	if %count% neq 0 (
		set FILE_NAME=%FILE_NAME%_%FILE_NUM%
	)
	goto :END
)
goto :name-define
:END

ren %BEFORE_LOGFILENAME% %LOGFILE_NAME%

if exist %LOGFILE_NAME% (
	echo;
	echo ログ保存が完了しました。
	echo ファイル名：%date:/=-% %FILE_NAME%.txt
	explorer %LOGFILE_PATH%
	echo;
) else (
	echo;
	echo ファイル名に使用できない文字が含まれています。
	echo;
)

echo 5秒後終了します。
timeout /t 5

endlocal
