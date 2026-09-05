@echo off
REM ── Open Geneesi in Chrome, forced onto the discrete GPU ────────────────────
REM
REM Why the separate profile directory matters: Chrome runs ONE GPU process and
REM shares it across every window. If Chrome is already running, launching
REM chrome.exe again just hands the URL to the existing process and the flag is
REM ignored -- which is exactly why the in-page powerPreference hint could not
REM move it either. --user-data-dir forces a brand new Chrome instance with its
REM OWN GPU process, and that process reads --force_high_performance_gpu.
REM
REM Verify it worked: open the settings menu and read the GPU button. It should
REM say RTX 4080, not Intel.

set "URL=http://127.0.0.1:5500/index.html"
set "CHROME=C:\Program Files\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

start "" "%CHROME%" ^
  --force_high_performance_gpu ^
  --user-data-dir="%LOCALAPPDATA%\GeneesiChromeGPU" ^
  --new-window "%URL%"
