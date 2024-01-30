@ECHO OFF

SET VERSION=643

SET ROOT=%~dp0
SET PATCH=%ROOT%patch
SET SRC=%ROOT%src
SET TEMPL=%ROOT%templ

rmdir /q /s "%SRC%"
curl.exe -sSLO "https://www.greenwoodsoftware.com/less/less-%VERSION%.zip"
7z.exe e -o"%SRC%" "less-%VERSION%.zip""

pushd "%TEMPL%"
"%BASH%" '.\gen.sh'
popd

pushd "%PATCH%"
"%BASH%" '.\patch.sh'
popd

pushd "%SRC%"
rc.exe /nologo less.rc
rc.exe /nologo lesskey.rc
nmake.exe /NOLOGO /f Makefile.wnm
popd
