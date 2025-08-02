# Stage 1: Build stage with dependencies
FROM python:3.10-slim as builder

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip &&     pip install --no-cache-dir -r requirements.txt

# Stage 2: Final, lean production stage
FROM python:3.10-slim

WORKDIR /usr/src/app

COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY . .

# Expose port 80 for the application
EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
