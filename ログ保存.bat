@echo off
setlocal enabledelayedexpansion

rem ���O�ۑ��t�H���_���w��
set LOGFILE_PATH="<���O�ۑ��t�H���_>"

set BEFORE_LOGFILENAME=%date:/=-%" "before_name.txt

echo �N���b�v�{�[�h�̓��e��ۑ����܂��B
powershell -command get-clipboard > %LOGFILE_PATH%\%BEFORE_LOGFILENAME%

set /p FILE_NAME="�t�������t�@�C��������͂��Ă��������F"
rem �uyyyy-mm-dd �t�@�C����.txt�v��ݒ�
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
	echo ���O�ۑ����������܂����B
	echo �t�@�C�����F%date:/=-% %FILE_NAME%.txt
	explorer %LOGFILE_PATH%
	echo;
) else (
	echo;
	echo �t�@�C�����Ɏg�p�ł��Ȃ��������܂܂�Ă��܂��B
	echo;
)

echo 5�b��I�����܂��B
timeout /t 5

endlocal
