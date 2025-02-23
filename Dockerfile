# Use an official Python image (AMD64)
FROM --platform=linux/amd64 python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies (needed for OpenCV & other packages)
RUN apt-get update && apt-get install -y \
    libglib2.0-0 libsm6 libxext6 libxrender-dev \
    wget git curl bzip2 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app

# Expose Gradio port (used for UI)
EXPOSE 7860

# Run the application
CMD ["python", "gradio_demo.py"]