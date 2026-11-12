@echo off
rem amd-hip port: builds edge0-strata for the RX 7900 XTX (gfx1100) and unpacks it into engine-hip\
rem Needs: Visual Studio 2022 Build Tools (C++ workload), Python 3.10+, git.  First run downloads ROCm (~7 GB) into .rocm-win
setlocal
cd /d "%~dp0"
set "STRATA_HIP_ARCHS=gfx1100"
set "STRATA_NO_VISION=1"
call tools\hip\build_windows.bat %* > build-amd.log 2>&1
if errorlevel 1 (
  echo BUILD FAILED - see %~dp0build-amd.log
  powershell -NoProfile -Command "Get-Content -Tail 40 '%~dp0build-amd.log'"
  pause
  exit /b 1
)
if not exist engine-hip mkdir engine-hip
tar -xf dist\strata-windows-x64-hip.zip -C engine-hip || (echo unpack failed & pause & exit /b 1)
echo Done: %~dp0engine-hip\strata.exe
pause
