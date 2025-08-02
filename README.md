<div align="center">
  <img src="https://raw.githubusercontent.com/user-attachments/assets/19a9a385-d72b-4228-abbf-8de6f5a3b0a7/aura-logo-dark.png#gh-dark-mode-only" alt="Aura Logo" width="400"/>
  <img src="https://raw.githubusercontent.com/user-attachments/assets/7516d034-3115-46ff-af9b-76b6b71f5446/aura-logo-light.png#gh-light-mode-only" alt="Aura Logo" width="400"/>
</div>

<h1 align="center">Aura: The Automated DevSecOps Platform</h1>

<p align="center">
  <strong>A production-grade, secure-by-design blueprint for deploying and managing cloud-native applications on AWS.</strong>
</p>

<p align="center">
    <a href="https://github.com/YOUR_USERNAME/aura/actions/workflows/2-cd-pipeline.yml"><img src="https://github.com/YOUR_USERNAME/aura/actions/workflows/2-cd-pipeline.yml/badge.svg" alt="CI/CD Pipeline Status"></a>
    <a href="#"><img src="https://img.shields.io/badge/Code%20Quality-A-brightgreen" alt="SonarQube Grade"></a>
    <a href="#"><img src="https://img.shields.io/badge/Vulnerabilities-0%20Critical-blue" alt="Trivy Scan"></a>
    <a href="https://github.com/YOUR_USERNAME/aura/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-purple" alt="License"></a>
</p>

---

Aura is not just a project; it's an architectural opinion. It demonstrates a holistic approach to DevSecOps, where security, infrastructure, and automation are treated as integral components of the software development lifecycle, not afterthoughts. This repository serves as a live, working example of how to build a resilient, scalable, and secure platform from the ground up using industry-best practices.

### 🏛️ Architectural Blueprint

At its core, Aura automates the entire journey from a `git push` to a monitored, production-ready application. The architecture is designed for security, resilience, and full observability.

```mermaid
graph TD
    subgraph "Development"
        A[Developer pushes to GitHub] --> B{GitHub Actions};
    end

    subgraph "CI/CD Pipeline on GitHub Actions"
        B -- on PR --> C[1. Lint & SAST <br> (SonarQube)];
        C -- on Merge to main --> D[2. Build Docker Images];
        D --> E[3. Scan Image <br> (Trivy)];
        E --> F[4. Push to AWS ECR];
        F --> G[5. Deploy with Helm];
    end

    subgraph "AWS Cloud Infrastructure (Managed by Terraform)"
        H[Amazon EKS Cluster];
        I[Amazon RDS <br> (PostgreSQL)];
        J[VPC & Networking];
        K[IAM Roles & Policies];

        F -- Triggers --> G;
        G -- Deploys to --> H;
        H -- Connects to --> I;
        H -- Lives in --> J;
        I -- Lives in --> J;
        J -- Governed by --> K;
    end

    subgraph "Observability Stack"
        L[Prometheus] -- Scrapes --> H;
        M[Grafana] -- Visualizes --> L;
    end




✨ Core Features

    100% Infrastructure as Code (IaC): The entire AWS infrastructure is defined declaratively using Terraform, enabling automated, repeatable, and version-controlled environments.

    Secure by Design: Adheres to a zero-trust model with fine-grained IAM roles, network segmentation via a custom VPC, encrypted data at rest and in transit, and secrets management with AWS Secrets Manager.

    End-to-End DevSecOps Pipeline: Leverages GitHub Actions for a full CI/CD workflow, including Static Application Security Testing (SonarQube) and container vulnerability scanning (Trivy) to shift security left.

    Scalable Container Orchestration: Deploys applications to a high-availability Amazon EKS cluster, managed with declarative configurations using Helm.

    Managed & Resilient Database: Utilizes Amazon RDS for PostgreSQL in isolated subnets for a secure, durable, and managed database solution.

    Deep Observability: Implements a robust monitoring stack with Prometheus for metrics collection and Grafana for visualization and alerting.

    One-Command Lifecycle: Employs a Makefile as a clean interface to abstract away complexity. make deploy builds everything; make destroy tears it all down.

🛠️ Technology Stack
Category	Technology
Cloud Provider	

![alt text](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

Infrastructure as Code	

![alt text](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

CI/CD Automation	

![alt text](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

Containerization	

![alt text](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

Orchestration	

![alt text](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

![alt text](https://img.shields.io/badge/Helm-0F1689?style=for-the-badge&logo=helm&logoColor=white)

Application Backend	

![alt text](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)

Database	

![alt text](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

Security Scanning	

![alt text](https://img.shields.io/badge/SonarQube-black?style=for-the-badge&logo=sonarqube&logoColor=4E9BCD)

![alt text](https://img.shields.io/badge/Trivy-24388F?style=for-the-badge&logo=trivy&logoColor=25A5E4)

Observability	

![alt text](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)

![alt text](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white)

Configuration Mgmt




📂 Repository Structure

The repository's structure is a deliberate architectural choice designed to enforce a strict separation of concerns. This philosophy ensures the project is maintainable, scalable, and intuitive.




/aura
├── .github/        # The Automation Engine: CI/CD workflows.
├── app/            # The Application Core: Source code, decoupled from infra.
├── configuration/  # Post-Provisioning: Ansible playbooks for node setup.
├── docs/           # The Knowledge Hub: Detailed architectural documentation.
├── infrastructure/ # The Cloud Blueprint: Terraform code for our AWS environment.
├── kubernetes/     # The Deployment Engine: Kubernetes manifests and Helm charts.
├── scripts/        # Utility & Glue Code: Helper scripts for setup and tasks.
└── ...




Architectural Justification

    app/ vs. infrastructure/: The most critical separation. Developers can work on the application in the app directory without needing to understand the complexities of the Terraform code in infrastructure. This decoupling is key to team velocity and specialization.

    infrastructure/ vs. kubernetes/: Provisioning the EKS cluster (infrastructure) is a separate concern from deploying an application to it (kubernetes). This allows us to update our application's Helm chart and redeploy it without ever touching the underlying infrastructure code.

    infrastructure/modules/: We do not write monolithic Terraform code. By breaking our infrastructure into reusable modules (like vpc, eks, rds), we create building blocks that are easier to test, maintain, and reuse across different environments. This is a hallmark of professional IaC.

    Makefile: This file acts as a clean abstraction layer. Instead of forcing a user to remember long terraform or kubectl commands, we provide a simple, unified interface (make deploy, make destroy). This makes the project accessible and reduces the chance of human error.

🚀 Getting Started
Prerequisites

    An AWS Account with administrative privileges.

    AWS CLI installed and configured (aws configure).

    Terraform (>= 1.2.0) installed.

    kubectl & Helm installed.



Deployment

    Clone the Repository:
    Generated bash

      
git clone https://github.com/YOUR_USERNAME/aura.git
cd aura

    

IGNORE_WHEN_COPYING_START
Use code with caution. Bash
IGNORE_WHEN_COPYING_END

Run the Setup Command:
Generated bash

      
make setup

    

IGNORE_WHEN_COPYING_START
Use code with caution. Bash
IGNORE_WHEN_COPYING_END

Deploy the Infrastructure: (This will take 15-20 minutes)
Generated bash

      
make deploy

    

IGNORE_WHEN_COPYING_START
Use code with caution. Bash
IGNORE_WHEN_COPYING_END

View the Application:
Generated bash

      
make view

    

IGNORE_WHEN_COPYING_START

    Use code with caution. Bash
    IGNORE_WHEN_COPYING_END

💥 The Nuke Button

To prevent unwanted AWS costs, you can tear down the entire infrastructure with a single command. This action is irreversible.
Generated bash

      
make destroy

    

IGNORE_WHEN_COPYING_START
Use code with caution. Bash
IGNORE_WHEN_COPYING_END
📖 Deeper Dive Documentation

For detailed information on specific architectural decisions and components, please refer to the /docs directory.
🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

    Fork the Project

    Create your Feature Branch (git checkout -b feature/AmazingFeature)

    Commit your Changes (git commit -m 'Add some AmazingFeature')

    Push to the Branch (git push origin feature/AmazingFeature)

    Open a Pull Request

📞 Contact

Your Name - Your LinkedIn Profile - your.email@example.com

Project Link: https://github.com/YOUR_USERNAME/aura

For project-specific questions or issues, please use the GitHub Issues page.

    This project is intended for demonstration and educational purposes. While it follows production-grade principles, always perform your own security audits before using it for live, business-critical applications.

