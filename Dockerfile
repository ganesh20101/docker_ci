# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy the script to the container
COPY app.py .

# Install dependencies (if needed, e.g., Flask)
# RUN pip install flask

# Command to run the Python script (ensure your app runs on a port, like 8080)
CMD ["python", "app.py"]
