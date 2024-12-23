
# Cloud-Engine Labs Assignment

## Overview
This project demonstrates the steps to create a simple Python program, containerize it using Docker, and automate the CI/CD pipeline using GitHub Actions. The project includes the creation of a Dockerfile, building and running a Docker container, and pushing the container image to a container registry. Additionally, Docker Compose is used to run the image, and GitHub Actions is set up for continuous integration.

## Project Steps

### Step 1: Python Program
A simple Python program, `hello_cloud.py`, was created to print the message:

```
Hello cloud-engine labs!!
```

### Step 2: Dockerfile Creation
A `Dockerfile` was created to build a Docker image for the Python program. The Dockerfile performs the following steps:

1. Uses the official Python image as the base image.
2. Sets the working directory inside the container.
3. Copies the Python script into the container.
4. Sets the command to run the Python script.

### Step 3: Building the Docker Image
The Docker image was built using the following command:

```bash
docker build -t hello-cloud-engine .
```

This command creates the Docker image with the tag `hello-cloud-engine`.

### Step 4: Running the Docker Container
To run the Docker container and print the output, the following command was used:

```bash
docker run hello-cloud-engine
```

Output:

```
Hello cloud-engine labs!!
```

### Step 5: GitHub Commit and Push
The project files (`app.py` and `Dockerfile`) were committed and pushed to a GitHub repository. The following steps were taken:

1. Initialized the Git repository with `git init`.
2. Added the files with `git add app.py Dockerfile`.
3. Committed the changes with the message: "Add Python script and Dockerfile".
4. Pushed the code to GitHub.

GitHub Repository: [docker_ci](https://github.com/ganesh20101/docker_ci.git)

---

## Senior Role "Good to Have" Features

### Step 6: GitHub Actions for Docker CI/CD
A GitHub Actions workflow was created for continuous integration. The workflow automatically builds and pushes the Docker image to a container registry whenever changes are pushed to the `master` branch. The workflow file `.github/workflows/docker.yml` was added with the following contents:

```yaml
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build Docker Image
        run: docker build -t ganesh20101/hello-cloud-engine-labs:${{ github.sha }} .

      - name: Push Docker Image to Docker Hub
        run: docker push ganesh20101/hello-cloud-engine-labs:${{ github.sha }}
```


```

### Step 7: Docker Compose File
A `docker-compose.yml` file was created to simplify the process of running the container. The file is as follows:

```yaml
version: '3'

services:
  hello-cloud-engine:
    image: ganesh20101/hello-cloud-engine-labs:309b33e224db2aa99783841b30ef208e34364d00
    ports:
      - "8080:8080"
```

The following command was used to run the service using Docker Compose:

```bash
docker-compose up
```

---

## How to Use

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ganesh20101/docker_ci.git
   cd https://github.com/ganesh20101/docker_ci.git
   ```

2. **Build the Docker Image**:
   ```bash
   docker build -t hello-cloud-engine .
   ```

3. **Run the Docker Container**:
   ```bash
   docker run hello-cloud-engine
   ```

4. **Access the Application via Port**:
   ```bash
   docker run -p 8080:8080 hello-cloud-engine
   ```

5. **Using Docker Compose**:
   ```bash
   docker-compose up
   ```

---



