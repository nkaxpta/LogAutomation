@echo off
setlocal enabledelayedexpansion

rem ���O�ۑ��t�H���_���w��
set LOGFILE_PATH="<���O�ۑ��t�H���_>"

set BEFORE_LOGFILENAME=%date:/=-%" "before_name.txt

echo �N���b�v�{�[�h�̓��e��ۑ����܂��B
rem ��U%BEFORE_LOGFILENAME%.txt�Ƃ��ĕۑ�
powershell -command get-clipboard > %LOGFILE_PATH%\%BEFORE_LOGFILENAME%

set /p FILE_NAME="��������t�@�C��������͂��Ă��������F"
rem �uyyyy-mm-dd �t�@�C����.txt�v��ݒ�
set LOGFILE_NAME=%date:/=-%" "%FILE_NAME%.txt

set FILE_NUM=1
set count=0
cd %LOGFILE_PATH%

rem ���łɓ����t�@�C���������݂��Ă��Ȃ������m�F ���݂��Ă���̂ł���΁u�t�@�C����_����.txt�v�̌`���ŕۑ�����悤�ɒ���
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

rem %BEFORE_LOGFILENAME%.txt�Ƃ��ĕۑ��������̂𖽖������t�@�C�����Ƃ��ă��l�[��
ren %BEFORE_LOGFILENAME% %LOGFILE_NAME%

if exist %LOGFILE_NAME% (
	echo;
	echo ���O�ۑ����������܂����B
	echo �t�@�C�����F%date:/=-% %FILE_NAME%.txt

	rem �ۑ��I����A�ۑ��t�H���_���J��
	explorer %LOGFILE_PATH%

	echo;
) else (
	echo;
	echo �w�肵���t�@�C�����ł̕ۑ��Ɏ��s���܂����B�t�@�C�����Ɏg�p�ł��Ȃ��������܂܂�Ă��Ȃ����m�F���Ă��������B
	echo;
)

echo 5�b��I�����܂��B
timeout /t 5

endlocal