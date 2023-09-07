resource "helm_release" "external_dns" {
  count            = var.enable_external_dns ? 1 : 0
  name             = "external-dns"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "external-dns"
  version          = var.external_dns_version
  create_namespace = true
  namespace        = "external-dns"
  values = [
    <<-EOF
	policy: sync
	serviceAccount:
	  create: true
	metrics:
	  enabled: true
	logLevel: debug
    EOF
  ]
  set {
    name  = "provider"
    value = "google"
  }
  set {
    name  = "google.project"
    value = var.project_id
  }
  set {
    name  = "serviceAccount.name"
    value = "external-dns"
  }
  set {
    name  = "serviceAccount.annotations.iam\\.gke\\.io/gcp-service-account"
    value = "external-dns@${var.project_id}.iam.gserviceaccount.com"
  }
}


# This module will create a Google Service account and configure the right permissions
# to be allowed to use the workload identity on GKE.
module "external_dns_workload_identity" {
  count               = var.enable_external_dns ? 1 : 0
  source              = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version             = "~> 27.0.0"
  name                = "external-dns"
  namespace           = "external-dns"
  project_id          = var.project_id
  roles               = ["roles/dns.admin"]
  use_existing_k8s_sa = true
  annotate_k8s_sa     = false
}
