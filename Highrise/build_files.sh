#!/bin/bash

echo "BUILD START"

# Update and install MySQL client libraries
apt-get update && apt-get install -y default-libmysqlclient-dev

# Set MYSQLCLIENT environment variables
export MYSQLCLIENT_CFLAGS=$(mysql_config --cflags)
export MYSQLCLIENT_LDFLAGS=$(mysql_config --libs)

# Upgrade pip and install Python dependencies
python3.9 -m pip install --upgrade pip
python3.9 -m pip install -r requirements.txt

# Create the output directory for static files
mkdir -p staticfiles/static

# Collect static files
python3.9 manage.py collectstatic --noinput --clear --settings=Highrise.settings

echo "BUILD END"
