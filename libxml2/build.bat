@ECHO OFF

SET VERSION=2.13.1

SET ROOT=%~dp0
SET BUILD=%ROOT%build
SET INSTALL=%ROOT%install
SET SRC=%ROOT%src
SET TEMPL=%ROOT%templ

rmdir /q /s "%SRC%"
mkdir "%SRC%"
pushd "%SRC%"
curl.exe -sSLO "https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.13.1/libxml2-v%VERSION%.tar.gz"
cmake -E tar xf libxml2-v%VERSION%.tar.gz
popd

cmake ^
    -D CMAKE_INSTALL_PREFIX="%INSTALL%" ^
    -D LIBXML2_WITH_ICONV=OFF ^
    -D LIBXML2_WITH_LZMA=OFF ^
    -D LIBXML2_WITH_PYTHON=OFF ^
    -D LIBXML2_WITH_ZLIB=OFF ^
    -S "%SRC%\libxml2-v%VERSION%" ^
    -B "%BUILD%"

cmake --build "%BUILD%" --config Release
cmake --install "%BUILD%"
