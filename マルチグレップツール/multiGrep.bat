rem @echo off
rem �x�����ϐ���ݒ�
setlocal ENABLEDELAYEDEXPANSION

rem ====== �ݒ�t�@�C���ǂݍ��� ======
for /f "tokens=1,2* delims==" %%i in (config.txt) do ( 
    set KEY=%%i
    if not "!KEY:~0,1!"=="#" (
        set %%i=%%j
    )
)

rem ====== ���s ======
echo �J�n > %OUTFILE%

rem �����L�[���[�h�ǂݍ���
for /f %%i in (keyword.txt) do (
    echo �L�[���[�h�F%%i >> %OUTFILE%
    rem �_�u���N�H�[�e�[�V�����̃G�X�P�[�v
    set KEYWORD=%%i
    set KEYWORD=!KEYWORD:%BEFORE_STRING%=%AFTER_STRING%!
    %SAKURA% -GREPMODE -GFOLDER=%GFOLDER% -GOPT=%GOPT% -GFILE=%GFILE% -GCODE=%GCODE% -GKEY="!KEYWORD!" >> %OUTFILE%
)
echo �I�� >> %OUTFILE%