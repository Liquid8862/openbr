@echo off
@echo This .bat file will build OpenBR compiled for Visual Studio 2019
@echo **************************************
@echo Warning: 
@echo There should not be any error during the following processing.
@echo If it does occur, please exit directly rather than continue.
@echo **************************************
pause
cd %ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build
call vcvars32.bat
@echo on
cd %~dp0
mkdir build-msvc2019
cd build-msvc2019
cmake -G "CodeBlocks - NMake Makefiles" -DCMAKE_PREFIX_PATH="./opencv452-build-msvc2019-install;./qt5152-build-msvc2019-install" -DCMAKE_INSTALL_PREFIX="./install" -DBR_INSTALL_DEPENDENCIES=ON -DCMAKE_BUILD_TYPE=Release ..
nmake
nmake install
@echo Process completed.
@echo The built files are located in %~dp0 build-msvc2019\install\
@echo Next, test it.
@pause
cd ./install/bin
br -gui -algorithm "Show(false)" -enroll 0.webcam
)
@echo Complete!
@pause