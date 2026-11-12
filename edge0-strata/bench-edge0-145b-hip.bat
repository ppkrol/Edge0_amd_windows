@echo off
rem amd-hip port: quick speed check of the Edge0 145B server already running on port 8081 (run-edge0-145b-hip.bat)
title Edge0 145B (HIP) - benchmark
cd /d "F:\edge0\edge0-strata"
"F:\Strata\.venv\Scripts\python.exe" tools\strata_bench.py --url http://127.0.0.1:8081 --config "F:\edge0\edge0-strata\strata-edge0-145b-hip.json" --compare "F:\Strata\bench\results\2026-11-05-community-rx-7900-xtx-qwen3-8-flash-next-unsloth-ud-iq3-xxs" %* > bench-amd.log 2>&1
type bench-amd.log
pause
