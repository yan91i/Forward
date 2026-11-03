@echo off
rem Forward - local launcher
rem Starts a tiny static web server and opens the game in the default browser.
rem A local server is required (the game loads audio via XHR, which file:// blocks).

setlocal
cd /d "%~dp0"
set PORT=8123

where python >nul 2>nul
if %errorlevel%==0 (
  start "" "http://127.0.0.1:%PORT%/"
  python -m http.server %PORT% --bind 127.0.0.1
  goto :eof
)

where py >nul 2>nul
if %errorlevel%==0 (
  start "" "http://127.0.0.1:%PORT%/"
  py -m http.server %PORT% --bind 127.0.0.1
  goto :eof
)

echo Python not found. Install Python, or run a static server with Node, e.g.:
echo   npx --yes serve -l %PORT% .
pause
