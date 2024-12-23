# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy the script to the container
COPY app.py .

# Command to run the Python script
CMD ["python", "app.py"]

