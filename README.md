#Aura: Automated DevSecOps Platform

> Production-grade AWS infrastructure with built-in security and full CI/CD automation.

[![CI/CD Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/elvisquant/aura/actions)
[![Security Scan](https://img.shields.io/badge/security-passed-blue)]()
[![Kubernetes](https://img.shields.io/badge/deployed-K8s-informational)]()
[![License: Internal](https://img.shields.io/badge/license-Central%20Bank%20Internal-yellow)]()

---

## 🧭 Executive Summary

This project powers a **centralized fleet management ecosystem** for a national central bank. It provides full lifecycle visibility and control of official vehicle resources across:

- ✅ **Trip Planning & Assignment**
- ✅ **Fuel, Maintenance & Repair Tracking**
- ✅ **Driver Lifecycle Management**
- ✅ **Cost Control & Real-Time Analytics**
- ✅ **Government Compliance & Reporting**

It is **designed for high-availability**, **secured via enterprise DevSecOps practices**, and **monitored at scale** with full CI/CD pipelines for code quality, security, and operational integrity.

---

## 🏗️ Architecture Overview

![System Diagram](docs/architecture_diagram.png)

| Layer               | Stack                                              |
|---------------------|----------------------------------------------------|
| **Frontend**        | HTML5, TailwindCSS, Vanilla JavaScript             |
| **Backend API**     | FastAPI, Pydantic, SQLAlchemy, JWT Auth            |
| **Database**        | PostgreSQL (managed RDS)                           |
| **CI/CD**           | Jenkins + GitHub + Docker + Kubernetes + Helm      |
| **Infrastructure**  | Terraform (AWS), Ansible (configuration)           |
| **Containerization**| Docker, Docker Compose                             |
| **Orchestration**   | EKS (AWS Kubernetes) + Helm + Nginx/Traefik        |
| **Security**        | SonarQube, Trivy, HTTPS, SealedSecrets             |
| **Monitoring**      | Prometheus, Grafana, Loki, AlertManager            |

---

## 🔐 Subdomain Map (with SSL)

| Subdomain                      | Service                      |
|--------------------------------|------------------------------|
| `app.fleet.elvisquant.com`     | Web frontend UI              |
| `api.fleet.elvisquant.com`     | REST API backend (FastAPI)   |
| `jenkins.fleet.elvisquant.com` | Jenkins CI/CD                |
| `monitor.fleet.elvisquant.com` | Prometheus + Grafana         |
| `sonar.fleet.elvisquant.com`   | SonarQube (code quality)     |

> All traffic is routed through **Traefik** Ingress with **HTTPS (Let's Encrypt)** SSL termination. Services are segmented by namespace and access roles.

---

## ⚙️ DevOps Automation Highlights

✅ **Push-to-Deploy** via GitHub/Jenkins  
✅ Docker images scanned using **Trivy**  
✅ Code quality enforced by **SonarQube**  
✅ Infrastructure-as-Code with **Terraform**   
✅ Server setup with **Ansible**  
✅ Monitored using **Prometheus + Grafana + Loki**  
✅ Secrets managed securely via **AWS Secrets Manager + SealedSecrets**  
✅ Notification support via **SMTP (Email alerts)**

---

## ✨ Core Features

### Vehicle Management
- Add, update, retire central bank vehicles
- Track condition, cost, ownership, and lifetime usage

### Trip & Assignment Planning
- Create official trips, assign vehicles and drivers
- Real-time trip tracking with status (pending, active, closed)

### Fuel & Repair Expense Management
- Log fuel purchases, repairs, part replacements
- Capture receipts from external garages and services

### Maintenance & Scheduling
- Predictive maintenance alerts (based on mileage or date)
- Service history per vehicle

### Dashboard & KPIs
- Total monthly operational cost
- Fleet availability rate
- Repair frequency per vehicle
- Fuel usage per trip or driver

### Roles & Access Control
- Admin (Full control)
- Fleet Officer (Trips, maintenance)
- Finance (Expense approval)
- Driver (View trips only)

---

## 📦 Project Structure

```bash
devops-fleet/
├── backend/           # FastAPI backend service
│   ├── app/           # Application modules
│   └── main.py        # Entry point
├── frontend/          # HTML, CSS, JS static UI
│   └── index.html     # Web UI
├── ci-cd/             # Jenkinsfile, SonarQube, Trivy scans
│   └── Jenkinsfile
├── infra/             # Terraform (IaC), Ansible (provisioning)
│   ├── terraform/     # Infrastructure modules
│   └── ansible/       # Server setup playbooks
├── docker/            # Dockerfiles, Traefik config
│   └── traefik/
├── k8s/               # Kubernetes manifests, Helm charts
│   ├── ingress/
│   └── deployments/
├── monitoring/        # Prometheus, Grafana, Loki setup
├── notifications/     # Email alerts, SMTP config
├── scripts/           # Full automation CLI scripts
│   └── git_push_all.sh
├── docs/              # Documentation, architecture diagram, QR codes
├── .env.example       # Example environment config
├── .gitignore
├── README.md
└── SOCIALS.md         # Social links with badges

```

---

## 🚀 Quick Start (Local Dev)

```bash
# Clone the project
git clone https://github.com/elvisquant/devops-fleet.git
cd devops-fleet

# Launch local containers
docker-compose up --build

# Run setup script for DevOps
./scripts/setup.sh
```

---

## 🔐 Security & Compliance

- 🔎 Static Code Analysis with SonarQube  
- 🛡️ Container Scanning with Trivy (OWASP compliance)  
- 🔐 HTTPS SSL encryption with Let's Encrypt + Traefik  
- 🔑 Secrets encrypted with Ansible Vault and SealedSecrets  
- 🔒 RBAC policies in Kubernetes  
- 📧 Email notifications for suspicious activity or failure events  

---

## 📊 Monitoring & Alerting

- 📈 Real-time dashboards (Grafana)  
- 📊 Custom Prometheus metrics  
- 🚨 Alertmanager for service incidents + email triggers  
- 💾 Uptime, memory, CPU, and DB query monitoring  

---

## 📧 Contact & Social Links

**Maintainer:** [Ndayishimiye Elvis](https://www.linkedin.com/in/elvisquant)  
**Title:** DevOps Engineer · Full Stack Developer · Cloud Architect · IaC Specialist



[![LinkedIn](https://img.shields.io/badge/-LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/elvisquant)
[![GitHub](https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/elvispronda/elvisquant)
[![X](https://img.shields.io/badge/-X-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/@elvisquant)
[![Website](https://img.shields.io/badge/-Website-24292e?style=for-the-badge&logo=google-chrome&logoColor=white)](https://quant.dev)
[![Instagram](https://img.shields.io/badge/-Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/elvisquant)




### 📲 Scan to Connect
![QR Code](https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https://www.linkedin.com/in/elvisquant)

💼 *Open to consulting, technical partnerships, DevOps automation projects, and open-source contributions.*

---

## 📄 License

**Confidential - Central Bank Use Only**  
Redistribution, duplication, or derivative work is strictly prohibited unless formally approved by the Central Bank legal office.

----

## 🤝 Future Roadmap

- 📱 Mobile app version for drivers  
- 📍 GPS tracking integration  
- 📄 PDF export of reports/invoices  
- 💰 Budget planning & forecasting AI  
- 🎙️ Voice command for trip dispatch  


---

## 📎 Downloadable Assets

✅ Your assets are ready! Download them below:

### 🗺️ System Architecture Diagram  
📥 [Download architecture_diagram.png](devops-fleet/docs/architecture_diagram.png)

### 📱 LinkedIn QR Code  
📥 [Download linkedin_qr.png](devops-fleet/docs/linkedin_qr.png)


