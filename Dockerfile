# Base image with Python
FROM python:3.8-slim 

# Set the working directory in the container
WORKDIR /usr/src/app

# Install OpenCV dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libopencv-dev \
    python3-opencv gcc tzdata \
    x11-utils xauth
RUN xauth add :1  MIT-MAGIC-COOKIE-1  1231564196


# Instalação de pacotes essenciais


# Setting the timezone
ENV TZ=America/Sao_Paulo 

# Install Python dependencies
COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt


# Copy the application files to the container
COPY . .


# Command to run the application

CMD ["python", "./mov_tracker.py"]
    