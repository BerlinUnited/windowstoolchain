@echo off

REM
SET EXTERN_PATH_NATIVE="%~dp0toolchain_native\extern"
SET NAO_CTC="%~dp0toolchain_nao"

echo Generate "projectconfig.user.lua"
call :print_config > projectconfig.user.lua


REM try to find the protoc.exe, if it there we assume the path is already added
:check_protoc
where protoc.exe
if not errorlevel 1 goto protoc_exists
echo add the bin path (premake5 and all the dll)
setx PATH "%path%;%~dp0toolchain_native\extern\bin;"
echo added following to the PATH:
echo "%~dp0toolchain_native\extern\bin"
echo .

:protoc_exists
set /p answer=Set environment variables (Y/n)? 
if /i "%answer:~,1%" EQU "N" goto add_mintty
echo set the path to the nao cross compile toolchain
setx NAO_CTC %NAO_CTC%
echo NAO_CTC=%NAO_CTC%
echo set the path to the external dependencies
setx EXTERN_PATH_NATIVE %EXTERN_PATH_NATIVE%
echo EXTERN_PATH_NATIVE=%EXTERN_PATH_NATIVE%
echo .

:add_mintty
REM try to find mintty.exe and generate add_mintty.reg
where mintty.exe
if errorlevel 1 (
	echo Could not find mintty.exe
	goto the_end
)
echo Generate "add_mintty.reg"
REM read the mintty.exe path
for /f "delims=" %%A in ('where mintty.exe') do set "MINTTY_PATH=%%A"
call :print_minnttyreg > add_mintty.reg

set /p answer=Add mintty to the context menu (Y/n)? 
if /i "%answer:~,1%" EQU "N" goto the_end
echo add the mintty to the context menu
add_mintty.reg

:print_config
echo.
echo -- special pathes which can be configured manualy.
echo -- If a path is set to 'nil' the default value is used.
echo -- for default values check projectconfig.lua
echo.
echo -- default: "../../Framework"
echo FRAMEWORK_PATH = nil
echo.
echo -- for native platform
echo -- default: "../../Extern"
echo EXTERN_PATH_NATIVE = %EXTERN_PATH_NATIVE:\=/%
echo.
echo -- path to the crosscompiler and libs
echo -- default: os.getenv("NAO_CTC")
echo NAO_CTC = %NAO_CTC:\=/%
echo -- or set both explicitely
echo -- default: NAO_CTC .. "/compiler"
echo COMPILER_PATH_NAO = nil
echo -- default: NAO_CTC .. "/extern"
echo EXTERN_PATH_NAO = nil
echo.
echo.
echo -- naoqi toolchain needed to compile the NaoSMAL
echo -- default: os.getenv("AL_DIR")
echo AL_DIR = nil
echo.
echo function set_user_defined_paths() 
echo.
echo   -- add your additional include directories here
echo   -- sysincludedirs { "my/nao/includes/path1" }
echo.
echo   -- add your additional lib directories here
echo   --syslibdirs { "my/nao/libs/path1" }
echo.
echo   -- NOTE: this should be used only for project internal files
echo   -- use this ONLY if you know what you are doing
echo   --includedirs {}
echo   --libdirs {}
echo end
echo.
EXIT /B


:print_minnttyreg
echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\mintty]
echo @=""
echo "Extended"=""
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\mintty\command]
echo @="%MINTTY_PATH:\=\\%"
echo.
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\Background\shell\mintty]
echo @=""
echo "Extended"=""
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\Background\shell\mintty\command]
echo @="%MINTTY_PATH:\=\\%"
echo.
EXIT /B

:the_end
pause