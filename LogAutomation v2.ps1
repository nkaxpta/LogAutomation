# ���O�ۑ��t�H���_���w��
$LOGFILE_PATH = "${���O�ۑ��t�H���_}"

$BEFORE_LOGFILENAME = (Get-Date -Format "yyyy-MM-dd") + " before_name.txt"

Write-Host "�N���b�v�{�[�h�̓��e��ۑ����܂��B"
# ��U $BEFORE_LOGFILENAME.txt �Ƃ��ĕۑ�
Get-Clipboard | Set-Content -Path "$LOGFILE_PATH\$BEFORE_LOGFILENAME"

$FILE_NAME = Read-Host "��������t�@�C��������͂��Ă�������"
# �uyyyy-mm-dd �t�@�C����.txt�v��ݒ�
$LOGFILE_NAME = (Get-Date -Format "yyyy-MM-dd") + " $FILE_NAME.txt"

$FILE_NUM = 1
$count = 0
Set-Location $LOGFILE_PATH

# ���łɓ����t�@�C���������݂��Ă��Ȃ������m�F ���݂��Ă���̂ł���΁u�t�@�C����_����.txt�v�̌`���ŕۑ�����悤�ɒ���
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
    Write-Host "���O�ۑ����������܂����B"
    Write-Host "�t�@�C�����F$LOGFILE_NAME"

    # �ۑ��I����A�ۑ��t�H���_���J��
    Invoke-Item "$LOGFILE_PATH"

    Write-Host ""
} else {
    Write-Host ""
    Write-Host "�w�肵���t�@�C�����ł̕ۑ��Ɏ��s���܂����B�t�@�C�����Ɏg�p�ł��Ȃ��������܂܂�Ă��Ȃ����m�F���Ă��������B" 
    Write-Host ""
}

Write-Host "5�b��I�����܂��B"
Start-Sleep -Seconds 5