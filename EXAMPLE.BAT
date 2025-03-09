@echo off
title Arcos' Dataset Compiling Scripts
echo.
powershell -ExecutionPolicy Bypass -File .\scripts\general.ps1 YES NO YES YES YES 1 "concept-name" "activation-token-to-prepend, " NO
pause
exit
