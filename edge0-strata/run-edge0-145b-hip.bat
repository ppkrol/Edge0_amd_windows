@echo off
title Edge0 145B (HIP)
cd /d "F:\edge0\edge0-strata"
"F:\Strata\.venv\Scripts\python.exe" "F:\edge0\edge0-strata\serve\server.py" "--engine" "strata" "--config" "F:\edge0\edge0-strata\strata-edge0-145b-hip.json" "--port" "8081"
if errorlevel 1 pause
