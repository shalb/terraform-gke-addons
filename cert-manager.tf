resource "helm_release" "cert_manager" {
  count            = var.enable_cert_manager ? 1 : 0
  name             = "cert-manager"
  chart            = "cert-manager"
  repository       = "https://charts.jetstack.io"
  version          = var.cert_manager_version # "v1.5.4"
  namespace        = "cert-manager"
  create_namespace = true
  cleanup_on_fail  = true

  set {
    name  = "installCRDs"
    value = true
  }
}

resource "helm_release" "cluster_issuer_letsencrypt_production" {
  name       = "cert-manager-resources"
  repository = "https://bedag.github.io/helm-charts/"
  chart      = "raw"
  version    = "2.0.0"
  namespace  = "cert-manager"
  values = [
    <<-EOF
    resources:
      - apiVersion: cert-manager.io/v1
        kind: ClusterIssuer
        metadata:
          name: letsencrypt-prod
        spec:
          acme:
            email: "some@mail.com"
            preferredChain: ""
            privateKeySecretRef:
              name: "letsencrypt-prod"
              service: ParameterStore
            server: "https://acme-v02.api.letsencrypt.org/directory"
            solver:
              http01:
                ingress:
                  class: "nginx"
    EOF
  ]
  depends_on = [
    helm_release.cert_manager
  ]
}
