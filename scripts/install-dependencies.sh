#!/bin/bash
set -e

# Install SQL Server Command-Line Tools
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
apt-get update
ACCEPT_EULA=Y apt-get install -y \
    mssql-tools unixodbc-dev

# Add sqlcmd to PATH for easier use
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

# (Optional) Install Python dependencies from requirements.txt
pip install -r requirements.txt

# (Optional) Add any additional tools or setups, like installing Node.js for extensions

echo "Hi! Welcome to the SQL sandbox for training!"