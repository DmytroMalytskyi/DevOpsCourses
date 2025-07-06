# Base Python Image
FROM python:3.11-slim

# Setting Environment Variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Working Directory Inside Container
WORKDIR /app

# Copying and installing dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copying all code to container
COPY . .

# Opening Port 8000
EXPOSE 8000

# Command to run flask application via gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
