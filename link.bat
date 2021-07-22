@echo off

rem カレントディレクトリに移動
cd /d %~dp0
echo %~dp0

call :MakeDirLink %USERPROFILE%\AppData\Local\nvim %~dp0nvim
call :MakeLink %USERPROFILE%\afxw64_163\AFXW.KEY %~dp0afxw\AFXW.KEY
call :MakeLink %USERPROFILE%\afxw64_163\AFXW.KEY.TXT %~dp0afxw\AFXW.KEY.TXT
call :MakeLink %USERPROFILE%\afxw64_163\AFXW.INI %~dp0afxw\AFXW.INI
call :MakeLink %USERPROFILE%\afxw64_163\AFXW.DEF %~dp0afxw\AFXW.DEF
pause
exit /b

:MakeLink
echo ファイルのシンボリックリンクを作成
echo %1 %2
rem ファイルを消す
del /q %1
rem ないならフォルダを作成する
md "%~dp1"
rem リンクを貼る
mklink %1 %2
echo;
exit /b

:MakeDirLink
echo ディレクトリのシンボリックリンクを作成
echo %1 %2
rem フォルダを消す
rd /q /s %1
rem ないならフォルダを作成する
md %~dp1
rem リンクを貼る
mklink /d %1 %2
echo;
exit /b