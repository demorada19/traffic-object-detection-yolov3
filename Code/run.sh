#!/bin/bash

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
    echo "Python3 is not installed. Please install it and try again."
    exit 1
fi

# Run the Python script
echo "Running Project.py..."
python3 Project.py
