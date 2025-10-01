variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "n8n_domain" {
  description = "Domain name for Nginx and Let's Encrypt"
  type        = string
  default     = "n8n.yourdomain.com"
}

variable "n8n_ssl_email" {
  description = "Email address for Let's Encrypt"
  type        = string
  default     = "admin@yourdomain.com"
}