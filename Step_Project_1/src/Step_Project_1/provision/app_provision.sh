#!/bin/bash

# -------------------------------
# Convert line endings to UNIX format
# -------------------------------
echo "Converting line endings to UNIX format..."
sudo apt-get update
sudo apt-get install -y dos2unix

# -------------------------------
# Install Java, Git, and Unzip
# -------------------------------
echo "Installing Java, Git, and Unzip..."
sudo apt-get install -y openjdk-8-jdk git unzip

# -------------------------------
# Create Application User and Directories
# -------------------------------
echo "Creating application user and directories..."
if ! id -u petapp >/dev/null 2>&1; then
  sudo useradd -m -s /bin/bash petapp
fi

sudo mkdir -p /home/petapp/app
sudo mkdir -p /home/petapp/project
sudo chown -R petapp:petapp /home/petapp

# -------------------------------
# Clone Repository and Build Project
# -------------------------------
echo "Cloning repository and building the project..."
sudo -u petapp bash <<EOF
set -e  # stop execution on error

cd /home/petapp/project

if [ ! -d source ]; then
  git clone --branch petclinic https://github.com/DmytroMalytskyi/DevOpsCourses.git source
fi

cd source/forStep1/PetClinic

# Processing line endings and setting permissions
chmod +x ./mvnw
dos2unix ./mvnw
dos2unix ./mvnw.cmd

# Building a project with skipped tests
./mvnw clean package -DskipTests
EOF

# -------------------------------
# Copy the JAR file to Application Directory
# -------------------------------
echo "Copying JAR file to application directory..."
JAR_FILE=$(find /home/petapp/project/source/forStep1/PetClinic/target -name "*.jar" | head -n 1)
if [ -f "$JAR_FILE" ]; then
  cp "$JAR_FILE" /home/petapp/app/app.jar
  chown petapp:petapp /home/petapp/app/app.jar
else
  echo "JAR file not found. Build may have failed."
  exit 1
fi

# -------------------------------
# Configure Environment Variables
# -------------------------------
echo "Configuring environment variables..."
cat <<EOT >> /home/petapp/.bashrc
export DB_HOST=${DB_HOST}
export DB_PORT=${DB_PORT}
export DB_NAME=${DB_NAME}
export DB_USER=${DB_USER}
export DB_PASS=${DB_PASS}
EOT

# -------------------------------
# Start the Application
# -------------------------------
echo "Starting the application..."
sudo -u petapp nohup java -jar /home/petapp/app/app.jar > /home/petapp/app/app.log 2>&1 &

sleep 5

# -------------------------------
# Verify the Service
# -------------------------------
if pgrep -f app.jar > /dev/null; then
    echo "PetClinic application started successfully."
else
    echo "PetClinic application failed to start. Check logs: /home/petapp/app/app.log"
fi