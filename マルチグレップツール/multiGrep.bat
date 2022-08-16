rem @echo off
rem 遅延環境変数を設定
setlocal ENABLEDELAYEDEXPANSION

rem ====== 設定ファイル読み込み ======
for /f "tokens=1,2* delims==" %%i in (config.txt) do ( 
    set KEY=%%i
    if not "!KEY:~0,1!"=="#" (
        set %%i=%%j
    )
)

rem ====== 実行 ======
echo 開始 > %OUTFILE%

rem 検索キーワード読み込み
for /f %%i in (keyword.txt) do (
    echo キーワード：%%i >> %OUTFILE%
    rem ダブルクォーテーションのエスケープ
    set KEYWORD=%%i
    set KEYWORD=!KEYWORD:%BEFORE_STRING%=%AFTER_STRING%!
    %SAKURA% -GREPMODE -GFOLDER=%GFOLDER% -GOPT=%GOPT% -GFILE=%GFILE% -GCODE=%GCODE% -GKEY="!KEYWORD!" >> %OUTFILE%
)
echo 終了 >> %OUTFILE%