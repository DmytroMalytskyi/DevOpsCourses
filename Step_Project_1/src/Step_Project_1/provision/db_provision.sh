#!/bin/bash

# -------------------------------
# Install MySQL and dependencies
# -------------------------------
echo "Installing MySQL Server..."
sudo apt-get update
sudo apt-get install -y mysql-server

# -------------------------------
# MySQL Configuration
# -------------------------------
echo "Configuring MySQL..."
sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# -------------------------------
# Restart MySQL Service
# -------------------------------
echo "Restarting MySQL..."
sudo systemctl restart mysql

# -------------------------------
# MySQL User and Database Setup
# -------------------------------
echo "🔄 Setting up database and user..."
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# -------------------------------
# Verify Database and User
# -------------------------------
echo "Database and user configuration complete."
mysql -u ${DB_USER} -p${DB_PASS} -e "SHOW DATABASES;"