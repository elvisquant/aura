#!/bin/bash

# This script creates a comprehensive .gitignore file tailored for a
# Python (FastAPI) and Terraform project.

# Stop on the first sign of an error
set -e

GITIGNORE_FILE=".gitignore"

echo "Creating a comprehensive .gitignore file..."

# Use a "Here Document" (cat <<EOF) to write the multi-line content to the file.
# This will overwrite the file if it already exists, ensuring a clean state.
cat <<EOF > "$GITIGNORE_FILE"
# ======================================================================================
# General
# ======================================================================================
# OS-generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor-specific files
.idea/
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
*.sublime-project
*.sublime-workspace

# ======================================================================================
# Python
# ======================================================================================
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
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

# PyInstaller
# Usually dist/ but behave like binaries
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/

# Environments
.env
.venv
env/
venv/
ENV/
env.bak
venv.bak


# ======================================================================================
# Terraform
# ======================================================================================
# Local Terraform directories
.terraform/

# .tfstate files
# These are CRITICAL to ignore. They contain secrets and infrastructure state.
*.tfstate
*.tfstate.*

# Crash log files
crash.log

# Exclude all .tfvars files, which are likely to contain sensitive data,
# such as password, private keys, and other secrets.
*.tfvars
*.tfvars.json

# Ignore override files as they are usually used for local testing and contain
# sensitive data.
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Include tfplan files to ignore the plan output of command, which may contain sensitive data.
*.tfplan

# Ignore CLI configuration files
.terraformrc
terraform.rc


# ======================================================================================
# Sensitive Files
# ======================================================================================
# AWS credentials
.aws/
credentials

# Private keys
*.pem
*.key
EOF

echo "✅ .gitignore file has been created successfully."
