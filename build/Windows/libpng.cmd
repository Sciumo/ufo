@echo off
call %~dp0/wdk/setup %~n0 %*
pushd %LB_PROJECT_ROOT%
git clean -fdx
setlocal

set NAME=%LB_PROJECT_NAME%

copy /y %LB_ROOT%\bin\Windows\%LB_TARGET_ARCH%\zlib.lib %LB_PROJECT_ROOT%\..\zlib
nmake -f scripts/makefile.vcwin32 CC="cl -I. %LB_CL_OPTS%" AR="link /LIB"

move /y %NAME%.lib %NAME%_static.lib

if "%LB_TARGET_BITS%"=="32" set CUTSYMPOS=12
if "%LB_TARGET_BITS%"=="64" set CUTSYMPOS=11

echo EXPORTS > %NAME%.def
rem link /DUMP /symbols /exports %NAME%_static.lib | grep " notype ()    External " | grep " SECT"  | cut -b%CUTSYMPOS%- | sort | uniq >> %NAME%.def
link /DUMP /NOLOGO /LINKERMEMBER:1 %NAME%_static.lib | grep -E " [ 0-9A-Z]{7}[0-9A-Z] [A-Za-z_]+" | cut -b%CUTSYMPOS%- | sort | uniq >> %NAME%.def

link %LB_LINK_OPTS% /OUT:%NAME%.dll /DEF:%NAME%.def %NAME%_static.lib %LB_PROJECT_ROOT%\..\zlib\zlib.lib
move /y %NAME%.dll %LB_PROJECT_NAME%.dll

call %~dp0/wdk/install %NAME%.dll
call %~dp0/wdk/install %NAME%.lib
call %~dp0/wdk/install %NAME%.pdb
endlocal
popd

