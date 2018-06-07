@echo off
set PYTHONPATH=%~dp0
set PYTHONDONTWRITEBYTECODE=True
if "%1"=="--nopause" (
  set nopause="True"
  python3 -m scapy.__init__
) else (
  set nopause="False"
  python3 -m scapy.__init__ %*
)
if %errorlevel%==1 if NOT "%nopause%"=="True" (
   PAUSE
)
