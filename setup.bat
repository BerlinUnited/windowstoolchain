@echo off

REM try to find the protoc.exe, if it there we assume the path is already added
where protoc.exe
if not errorlevel 1 goto path_exists
echo add the bin path (premake4 and all the dll)
setx PATH "%path%;%~dp0toolchain_native\extern\bin;"
echo added following to the PATH:
echo "%~dp0toolchain_native\extern\bin"
echo .

:path_exists
set /p answer=Set environment variables (Y/n)? 
if /i "%answer:~,1%" EQU "N" goto add_mintty
echo set the path to the nao cross compile toolchain
setx NAO_CTC "%~dp0toolchain_nao"
echo NAO_CTC=%NAO_CTC%
echo set the path to the external dependencies
setx EXTERN_PATH_NATIVE "%~dp0toolchain_native\extern"
echo EXTERN_PATH_NATIVE=%EXTERN_PATH_NATIVE%
echo .

:add_mintty
set /p answer=Add mintty to the context menu (Y/n)? 
if /i "%answer:~,1%" EQU "N" goto the_end
echo add the mintty to the context menu
add_mintty.reg

:the_end
pause
