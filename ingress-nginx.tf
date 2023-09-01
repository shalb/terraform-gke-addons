resource "helm_release" "ingress_nginx" {
  count            = var.enable_nginx ? 1 : 0
  name             = "ingress-nginx"
  chart            = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx/"
  version          = var.ingress_nginx_version
  namespace        = "ingress-nginx"
  create_namespace = true
  cleanup_on_fail  = true
}
