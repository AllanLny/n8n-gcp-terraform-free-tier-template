# n8n GCP Terraform Free Tier Template

[![Deploy N8N on GCP](https://github.com/allanlny/n8n-gcp-terraform-free-tier-template/actions/workflows/Deploy%20N8N%20on%20gcp.yml/badge.svg)](.github/workflows/Deploy%20N8N%20on%20gcp.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-1.6%2B-623CE4?logo=terraform)](https://www.terraform.io/)
[![GCP Free Tier](https://img.shields.io/badge/GCP-Free--Tier-4285F4?logo=googlecloud)](https://cloud.google.com/free)
[![n8n](https://img.shields.io/badge/n8n-automation-2088FF?logo=n8n)](https://n8n.io/)

> **Easily deploy [n8n](https://n8n.io/) on Google Cloud Free Tier with Docker, Nginx, and automatic SSL using Terraform and GitHub Actions.**

---

## ✨ Features

- **One-click deployment** of n8n on GCP Free Tier VM (Ubuntu 22.04)
- **Dockerized n8n** with persistent volume
- **Nginx reverse proxy** with automatic SSL (Let's Encrypt)
- **Custom domain support** (e.g., via Dynu.com or any DNS provider)
- **Automated deployment** via GitHub Actions
- **Infrastructure as Code**: reproducible, versioned, and auditable
- **Free to run** on GCP Free Tier (e2-micro)

---

## 🚀 Quick Start

### 1. Fork & Clone the Repository

```bash
git clone https://github.com/<your-username>/n8n-gcp-terraform-free-tier-template.git
cd n8n-gcp-terraform-free-tier-template/terraform
```

### 2. Configure Google Cloud Platform

- **Create a new GCP project** (or use an existing one).
- **Enable billing** and the following APIs:
  - Compute Engine API
  - Cloud Resource Manager API
- **Create a service account** with "Editor" role.
- **Generate a JSON key** for the service account and download it.
- **Note your `project_id`** (visible in the GCP console).

### 3. Set Up Your Domain (Dynu.com or Other DNS Provider)

- Register a domain (e.g., via [Dynu.com](https://www.dynu.com/) or any provider).
- Create an **A record** pointing your domain (e.g., `n8n.yourdomain.com`) to the external IP of your GCP VM (you can update this after the first deployment).
- You can use a free dynamic DNS service if you don't have a static IP.

### 4. Configure GitHub Secrets

In your forked repository, go to **Settings > Secrets and variables > Actions** and add:

- `GCP_CREDENTIALS`: Paste the entire content of your GCP service account JSON key.
- `GCP_PROJECT_ID`: Your GCP project ID.
- `N8N_DOMAIN`: Your chosen domain (e.g., `n8n.yourdomain.com`).
- `N8N_SSL_EMAIL`: Your email for Let's Encrypt (e.g., `admin@yourdomain.com`).

### 5. Configure Terraform Variables

Edit [`terraform/terraform.tfvars`](terraform/terraform.tfvars):

```hcl
project_id    = "your-gcp-project-id"
region        = "europe-west1"
zone          = "europe-west1-b"
n8n_domain    = "your-domain.com"
n8n_ssl_email = "your@email.com"
```

### 6. Deploy via GitHub Actions

- Push any change to the `main` branch (or trigger the workflow manually).
- The workflow in [`.github/workflows/Deploy N8N on gcp.yml`](.github/workflows/Deploy%20N8N%20on%20gcp.yml) will:
  - Authenticate to GCP
  - Run Terraform to provision the VM, firewall, and deploy n8n with Docker and Nginx
  - Set up SSL automatically

---

## 🌐 Access n8n

- Once deployment is complete, find your VM's **external IP** in the GCP console.
- Access n8n at:  
  `https://yourdomain.com`  
  (SSL will be automatically configured)

---

## 📥 Import n8n Workflows

1. Go to your n8n instance.
2. Menu > Import workflow > Paste your workflow JSON.

---

## 🛡️ Security Notes

- Change default ports in [`terraform/main.tf`](terraform/main.tf) and [`terraform/startup.sh`](terraform/startup.sh) if needed.
- Protect your n8n instance with authentication (see [n8n docs](https://docs.n8n.io/hosting/security.html)).
- Never commit secrets or service account keys to the repository.

---

## 🖥️ Local Deployment (Optional)

If you want to test locally:

```bash
terraform init
terraform apply
```

---

## 🧩 Project Structure

```
.
├── .github/workflows/Deploy N8N on gcp.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── startup.sh
│   └── README.md
├── .gitignore
└── README.md
```

---

## 🛠️ Troubleshooting

- Check VM logs in GCP for startup errors.
- Check `/var/log/startup-script.log` and `/var/log/certbot-startup.log` on the VM for detailed logs.
- Ensure your domain's DNS is correctly set up and propagated.
- For issues with SSL, verify DNS propagation and that port 80/443 are open.

---

## 📄 License

MIT

---

## 🙏 Credits

- [n8n.io](https://n8n.io/)
- [Terraform](https://www.terraform.io/)
- [Google Cloud Platform](https://cloud.google.com/)
- [Dynu.com](https://www.dynu.com/)