resource "helm_release" "external_secrets" {
  count            = var.enable_external_secrets ? 1 : 0
  name             = "external-secrets"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  version          = var.external_secrets_version
  create_namespace = true
  namespace        = "external-secrets"

  set {
    name  = "replicaCount"
    value = "1"
  }

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-secrets"
  }

  set {
    name  = "resources.requests.cpu"
    value = "0.1"
  }

  set {
    name  = "resources.requests.memory"
    value = "200Mi"
  }

  set {
    name  = "resources.limits.cpu"
    value = "0.3"
  }

  set {
    name  = "resources.limits.memory"
    value = "400Mi"
  }

  set {
    name  = "prometheus.enabled"
    value = "false"
  }

  set {
    name  = "env.POLLER_INTERVAL_MILLISECONDS"
    value = "10000"
  }
}


# This module will create a Google Service account and configure the right permissions
# to be allowed to use the workload identity on GKE.
module "cert_manager_workload_identity" {
  count               = var.enable_external_secrets ? 1 : 0
  source              = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version             = "~> 27.0.0"
  name                = "external-secrets"
  namespace           = "external-secrets"
  project_id          = var.project_id
  roles               = ["roles/iam.serviceAccountTokenCreator"]
  use_existing_k8s_sa = true
  annotate_k8s_sa     = false
}
