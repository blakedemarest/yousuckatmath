#!/bin/bash
# Setup script for YouSuckAtMath.com development environment

set -e  # Exit on error

echo "Setting up development environment for YouSuckAtMath.com..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install it first."
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install it first."
    exit 1
fi

# Navigate to the project root directory
cd "$(dirname "$0")/.."
ROOT_DIR=$(pwd)

echo "Installing pre-commit hooks..."
pip install pre-commit
pre-commit install

echo "Setting up server environment..."
cd "$ROOT_DIR/server"
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
# Create a .env file if it doesn't exist
if [ ! -f .env ]; then
    cp ../.env.example .env
fi

echo "Setting up client environment..."
cd "$ROOT_DIR/client"
npm install
# Create a .env file if it doesn't exist
if [ ! -f .env ]; then
    cp ../.env.example .env
fi

echo "Setup complete! You can now start developing."
echo ""
echo "To start the backend server:"
echo "  cd server"
echo "  source .venv/bin/activate  # On Windows: .venv\\Scripts\\activate"
echo "  uvicorn app.main:app --reload"
echo ""
echo "To start the frontend development server:"
echo "  cd client"
echo "  npm start"
