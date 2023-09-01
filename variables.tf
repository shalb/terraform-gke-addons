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

variable "cluster-name" {
  type        = string
  default     = ""
  description = "gke cluster name"
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