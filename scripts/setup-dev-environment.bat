@echo off
REM Setup script for YouSuckAtMath.com development environment on Windows

echo Setting up development environment for YouSuckAtMath.com...

REM Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install it first.
    exit /b 1
)

REM Check if Node.js is installed
node --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Node.js is not installed. Please install it first.
    exit /b 1
)

REM Navigate to the project root directory
cd /d "%~dp0\.."
set ROOT_DIR=%cd%

echo Installing pre-commit hooks...
pip install pre-commit
pre-commit install

echo Setting up server environment...
cd /d "%ROOT_DIR%\server"
python -m venv .venv
call .venv\Scripts\activate.bat
pip install --upgrade pip
pip install -r requirements.txt
REM Create a .env file if it doesn't exist
if not exist .env (
    copy ..\\.env.example .env
)

echo Setting up client environment...
cd /d "%ROOT_DIR%\client"
npm install
REM Create a .env file if it doesn't exist
if not exist .env (
    copy ..\\.env.example .env
)

echo Setup complete! You can now start developing.
echo.
echo To start the backend server:
echo   cd server
echo   .venv\Scripts\activate
echo   uvicorn app.main:app --reload
echo.
echo To start the frontend development server:
echo   cd client
echo   npm start

pause
