variable "gke_endpoint" {
  type        = string
  default     = ""
  description = "gke cluster host endpoint"
}

variable "gke_ca_certificate" {
  type        = string
  default     = ""
  description = "gke cluster ca certificate"
}

variable "project_id" {
  type        = string
  default     = ""
  description = "google project id"
}

variable "enable_reloader" {
  type        = bool
  default     = false
  description = "Disable/enable reloader"
}

variable "reloader_version" {
  type        = string
  default     = "v0.0.118"
  description = "Reloader chart version"
}

variable "enable_cert_manager" {
  type        = bool
  default     = false
  description = "Disable/enable cert manager"
}

variable "cert_manager_version" {
  type        = string
  default     = "v1.5.4"
  description = "Cert manager helm chart version"
}

variable "enable_nginx" {
  type        = bool
  default     = false
  description = "Disable/enable Nginx Ingress"
}

variable "ingress_nginx_version" {
  type        = string
  default     = "4.2.5"
  description = "Ingress nginx helm chart version"
}

variable "external_secrets_version" {
  type        = string
  default     = "0.9.4"
  description = "External secrets helm chart version"
}

variable "enable_external_secrets" {
  type        = bool
  default     = false
  description = "Disable/enable external secrets"
}

variable "argocd_chart_version" {
  type        = string
  default     = "5.43.3"
  description = "Argocd helm chart version"
}

variable "argocd_image_tag" {
  type        = string
  default     = "v2.8.0"
  description = "Argocd docker image version"
}

variable "argocd_password_bcrypted" {
  type        = string
  description = "Bctypted password (hash) for argocd web ui"
  default     = ""
}

variable "enable_argocd" {
  type        = bool
  default     = false
  description = "Disable/enable ArgoCD addon"
}
variable "domain" {
  type        = string
  description = "DNS domain to create apps DNS records for applications"
}

variable "enable_external_dns" {
  type        = bool
  default     = false
  description = "Disable/enable external dns"
}

variable "external_dns_version" {
  type        = string
  default     = "6.5.6"
  description = "External dns helm chart version"
}
