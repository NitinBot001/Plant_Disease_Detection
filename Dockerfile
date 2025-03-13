FROM python:3.7-slim-buster 

# Update package lists and install dependencies with cleanup in one layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python3-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# Upgrade pip and install requirements
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY app app/

# Expose port and set command
EXPOSE 8080
CMD ["python", "app/server.py", "serve"]
