# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy the requirements file (if you have one)
COPY requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# If you don't have a requirements.txt, you can install Flask directly
# RUN pip install flask

# Copy the Python script to the container
COPY app.py .

# Command to run the Python script (ensure your app runs on a port, like 8080)
CMD ["python", "app.py"]
