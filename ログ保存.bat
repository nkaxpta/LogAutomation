@echo off
setlocal

rem ���O�ۑ��t�H���_���w��
set LOGFILE_PATH="C:\Users\kouno\Desktop\�T�[�o��ƃ��O"

set BEFORE_LOGFILENAME=%date:/=-%" "before_name.txt

echo �N���b�v�{�[�h�̓��e��ۑ����܂��B
powershell -command get-clipboard > %LOGFILE_PATH%\%BEFORE_LOGFILENAME%

rem �ϐ�LOG��1�s����������Ȃ��H���ۂ� ���s��
rem for /f "usebackq" %%A in (`powershell -command get-clipboard -format text`) do set LOG=%%A

set /p FILE_NAME="�t�������t�@�C��������͂��Ă��������F"
rem �uyyyy-mm-dd �t�@�C����.txt�v��ݒ�
set LOGFILE_NAME=%date:/=-%" "%FILE_NAME%.txt

cd %LOGFILE_PATH%
ren %BEFORE_LOGFILENAME% %LOGFILE_NAME%

if exist %LOGFILE_NAME% (
	echo;
	echo ���O�ۑ����������܂����B
	echo �t�@�C�����F%date:/=-% %FILE_NAME%.txt
	echo;
) else (
	echo;
	echo �t�@�C�����Ɏg�p�ł��Ȃ��������܂܂�Ă��܂��B
	echo;
)

echo 5�b��I�����܂��B
timeout /t 5

endlocal