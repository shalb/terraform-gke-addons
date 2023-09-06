resource "helm_release" "argocd" {
  count            = var.enable_argocd ? 1 : 0
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version
  namespace        = "argocd"
  create_namespace = true
  name             = "argocd"
  values = [
    <<-EOF
	server:
	  ingress:
	    enabled: true
	    ingressClassName: "nginx"
	    annotations:
	      cert-manager.io/cluster-issuer: "letsencrypt-prod"
	      kubernetes.io/tls-acme: true
	      nginx.ingress.kubernetes.io/ssl-passthrough: "true"
	      nginx.ingress.kubernetes.io/backend-protocol: "HTTP"
	    tls:
	      - secretName: "argocd-secret"
	  extraArgs:
	    - --insecure
	  certificate:
	    issuer:
	      kind: "ClusterIssuer"
	      name: "letsencrypt-prod"
	    enabled: true
	configs:
	  secret:
	    argocdServerAdminPasswordMtime: "2021-01-01T00:00:00Z"
	service:
	  type: "LoadBalancer"
    EOF
  ]
  set {
    name  = "server.config.url"
    value = "https://argocd.${var.domain}"
  }
  set {
    name  = "server.ingress.tls[0].hosts[0]"
    value = "argocd.${var.domain}"
  }
  set {
    name  = "server.certificate.domain"
    value = "argocd.${var.domain}"
  }
  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_password_bcrypted
  }
  set {
    name  = "server.ingress.hosts[0]"
    value = "argocd.${var.domain}"
  }
  set {
    name  = "global.image.tag"
    value = var.argocd_image_tag
  }
  depends_on = [
    helm_release.cert_manager
  ]
}
