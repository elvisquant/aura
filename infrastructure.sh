#!/bin/bash

# This script creates the complete, professional directory structure
# for the "Aura" DevSecOps showcase project, tailored for a
# FastAPI backend and a static (non-Node.js) frontend.

# Stop on the first sign of an error
set -e

# --- Configuration ---
PROJECT_NAME="aura"

# --- Main Logic ---
echo "Starting project initialization for '$PROJECT_NAME'..."

if [ -d "$PROJECT_NAME" ]; then
  echo "Error: Directory '$PROJECT_NAME' already exists."
  exit 1
fi

echo "Creating root directory: $PROJECT_NAME"
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

echo "Creating core directories..."
mkdir -p .github/workflows
mkdir -p app/backend/api app/backend/core app/backend/db
mkdir -p app/frontend/static/css app/frontend/static/js
mkdir -p configuration/roles/eks-node-setup/tasks
mkdir -p docs
mkdir -p infrastructure/modules/vpc infrastructure/modules/eks infrastructure/modules/rds infrastructure/modules/iam infrastructure/modules/security-groups
mkdir -p infrastructure/environments/dev
mkdir -p kubernetes/charts/aura-app/templates
mkdir -p scripts

echo "Creating placeholder files and configuration templates..."

# --- Root Files ---
touch README.md LICENSE Makefile

# .gitignore (Node.js section removed)
cat <<EOF > .gitignore
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST
*.pot
*.pyo
*.pyd
.venv/
venv/
env/

# Terraform
**/.terraform/*
*.tfstate
*.tfstate.*
crash.log
*.tfvars
override.tf
override.tf.json
*_override.tf
*_override.tf.json
.terraformrc
terraform.rc
EOF

# README.md
cat <<EOF > README.md
# Aura - A Secure DevOps Ecosystem

A production-grade, fully automated DevSecOps platform on AWS using Terraform, EKS, and GitHub Actions. This project features a FastAPI backend and a static frontend.

*More content to come...*
EOF


# --- GitHub Actions ---
touch .github/workflows/1-ci-pipeline.yml .github/workflows/2-cd-pipeline.yml .github/workflows/3-manual-destroy.yml

# --- Application ---
# Backend (FastAPI) - This part remains the same
touch app/backend/api/.gitkeep app/backend/core/.gitkeep app/backend/db/.gitkeep
touch app/backend/main.py app/backend/requirements.txt app/backend/Dockerfile

cat <<EOF > app/backend/main.py
from fastapi import FastAPI

app = FastAPI(title="Aura Backend")

@app.get("/api/health")
def health_check():
    """Health check endpoint"""
    return {"status": "ok"}

@app.get("/api")
def read_root():
    return {"message": "Welcome to the Aura API!"}
EOF

cat <<EOF > app/backend/requirements.txt
fastapi
uvicorn[standard]
EOF

cat <<EOF > app/backend/Dockerfile
# Stage 1: Build stage with dependencies
FROM python:3.10-slim as builder

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Stage 2: Final, lean production stage
FROM python:3.10-slim

WORKDIR /usr/src/app

COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY . .

# Expose port 80 for the application
EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
EOF

# Frontend (Static HTML/CSS/JS) - UPDATED
touch app/frontend/static/index.html
touch app/frontend/static/css/style.css
touch app/frontend/static/js/script.js
touch app/frontend/Dockerfile

cat <<EOF > app/frontend/static/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aura Project</title>
    <!-- In a real project, you would link to your compiled TailwindCSS file -->
    <link href="./css/style.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-4">
        <h1 class="text-3xl font-bold">Welcome to Aura</h1>
        <p>Your static frontend is successfully served by Nginx!</p>
    </div>
    <script src="./js/script.js"></script>
</body>
</html>
EOF

cat <<EOF > app/frontend/Dockerfile
# Use a lightweight Nginx image to serve static files
FROM nginx:1.21-alpine

# Copy the static content of your frontend into the Nginx html directory
COPY ./static /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# The default Nginx command will start the server.
CMD ["nginx", "-g", "daemon off;"]
EOF

# --- Configuration (Ansible) ---
touch configuration/playbook.yml
touch configuration/roles/eks-node-setup/tasks/main.yml

# --- Docs ---
touch docs/1-architecture.md docs/2-setup-guide.md docs/3-pipeline-deep-dive.md docs/4-security-measures.md docs/5-monitoring-and-alerts.md

# --- Infrastructure (Terraform) ---
touch infrastructure/modules/vpc/.gitkeep infrastructure/modules/eks/.gitkeep infrastructure/modules/rds/.gitkeep infrastructure/modules/iam/.gitkeep infrastructure/modules/security-groups/.gitkeep
touch infrastructure/environments/dev/main.tf infrastructure/environments/dev/variables.tf infrastructure/environments/dev/outputs.tf infrastructure/environments/dev/backend.tf infrastructure/environments/dev/terraform.tfvars

cat <<EOF > infrastructure/environments/dev/backend.tf
# To enable remote state, create the S3 bucket and DynamoDB table first,
# then uncomment this block and run 'terraform init'.

# terraform {
#   backend "s3" {
#     bucket         = "your-unique-terraform-state-bucket-name"
#     key            = "dev/platform/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-lock"
#   }
# }
EOF

# --- Kubernetes (Helm) ---
touch kubernetes/charts/aura-app/Chart.yaml kubernetes/charts/aura-app/values.yaml
touch kubernetes/charts/aura-app/templates/_helpers.tpl kubernetes/charts/aura-app/templates/deployment.yaml kubernetes/charts/aura-app/templates/service.yaml kubernetes/charts/aura-app/templates/ingress.yaml kubernetes/charts/aura-app/templates/hpa.yaml kubernetes/charts/aura-app/templates/secrets.yaml

cat <<EOF > kubernetes/charts/aura-app/Chart.yaml
apiVersion: v2
name: aura-app
description: A Helm chart for deploying the Aura application
type: application
version: 0.1.0
appVersion: "1.0.0"
EOF

# --- Scripts ---
touch scripts/setup.sh scripts/get_app_url.sh
chmod +x scripts/*.sh

echo "-------------------------------------------"
echo "Project '$PROJECT_NAME' created successfully!"
echo "Next steps:"
echo "1. cd $PROJECT_NAME"
echo "2. git init"
echo "3. git add ."
echo "4. git commit -m 'feat: Initial project structure for FastAPI and static frontend'"
echo "5. Create a remote repository on GitHub and push."
echo "-------------------------------------------"