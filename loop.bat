@echo off
py -3 -m pip install psutil requests
:LOOP
py -3 loop.py
timeout /t 10
goto LOOP
