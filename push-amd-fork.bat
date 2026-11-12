@echo off
rem amd-hip port: commits the AMD changes on branch amd-hip and pushes them to the fork
setlocal
cd /d "%~dp0"
git remote get-url fork >nul 2>nul || git remote add fork https://github.com/ppkrol/Edge0_amd_windows.git
git checkout -B amd-hip || goto :err
git add edge0-strata/CMakeLists.txt edge0-strata/.gitignore edge0-strata/src/core/verify.cpp edge0-strata/src/prefill/prefill.cpp edge0-strata/src/prefill/moe_fused.cu edge0-strata/src/prefill/moe_fused_q3k.cu edge0-strata/build-amd.bat edge0-strata/bench-edge0-145b-hip.bat push-amd-fork.bat || goto :err
git add -f edge0-strata/run-edge0-145b-hip.bat edge0-strata/strata-edge0-145b-hip.json || goto :err
git status --short
git commit -F .git\AMD_COMMIT_MSG.txt || goto :err
git push -u fork amd-hip || goto :err
echo Done: https://github.com/ppkrol/Edge0_amd_windows/tree/amd-hip
pause
exit /b 0
:err
echo FAILED - see the message above
pause
exit /b 1
