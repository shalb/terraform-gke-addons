# GCP GKE Terraform Module

[![Cluster.dev logo](https://raw.githubusercontent.com/shalb/cluster.dev/master/docs/images/cdev-module-banner.png?sanitize=true)](https://cluster.dev/)

Terraform module that deploys essential core add-ons to your Google Kubernetes Engine (GKE) cluster. This Terraform module is also used as part of the [GCP-GKE Cluster.dev stack template](https://github.com/shalb/cdev-gcp-gke) to start and provision a GKE cluster with add-ons in Google Cloud Platform. 

## Features

The module installs the following add-ons to a GKE cluster:

1. **Ingress-Nginx**: Easily deploy the Ingress Nginx controller, which provides a powerful and scalable solution for managing external access to services within your GKE cluster. Ingress Nginx is crucial for routing external traffic to your applications.

2. **External-DNS**: Seamlessly configure External DNS for your GKE cluster. External DNS automatically manages DNS records in your chosen DNS provider based on changes in your cluster's services and Ingress resources. It simplifies DNS management and ensures that your applications are always reachable via DNS.

3. **External-Secrets**: Securely manage secrets in your GKE cluster using External Secrets. This module helps you integrate External Secrets, which allows you to fetch secrets from various secret stores and inject them into your pods as environment variables or files. This enhances the security and flexibility of secret management.

4. **Cert-Manager**: Deploy Cert-Manager to automate the management of SSL/TLS certificates in your GKE cluster. Cert-Manager simplifies the process of obtaining and renewing certificates from Let's Encrypt or other certificate authorities, ensuring that your applications are served over HTTPS securely.

5. **Reloader**: Automatically update ConfigMaps and Secrets in your Kubernetes cluster when their sources change. Reloader helps keep your cluster configuration up-to-date by watching for changes in ConfigMaps and Secrets and triggering updates when changes occur.

By using this Terraform module, you can streamline the deployment of these essential add-ons, including Reloader, and focus on developing and running your applications without worrying about the complexities of add-on setup.

## Usage

To use this Terraform module for installing core add-ons in your GKE cluster, follow these steps:

1. **Module Configuration**: In your Terraform configuration, define the module and configure the necessary variables. Here's an example of how to include this module in your Terraform code:

   ```hcl
   module "gke_core_addons" {
     source = "github.com/shalb/terraform-gke-addons?ref=0.0.6"

     gke_endpoint            = gke.endpoint
     gke_ca_certificate      = gke.ca_certificate
     project_id              = project_id
     enable_reloader         = true
     enable_nginx            = true
     enable_cert_manager     = true
     enable_external_secrets = true
     enable_argocd           = true
     enable_external_dns     = true
     domain                  = "demo.gcp.cluster.dev"
   }
   ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.80.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.20.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.81.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.11.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_external_dns_workload_identity"></a> [external\_dns\_workload\_identity](#module\_external\_dns\_workload\_identity) | terraform-google-modules/kubernetes-engine/google//modules/workload-identity | ~> 27.0.0 |
| <a name="module_external_secrets_workload_identity"></a> [external\_secrets\_workload\_identity](#module\_external\_secrets\_workload\_identity) | terraform-google-modules/kubernetes-engine/google//modules/workload-identity | ~> 27.0.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cluster_gcp_secret_store](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cluster_issuer_letsencrypt_production](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.ingress_nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.reloader](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [random_id.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_client_config.client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_chart_version"></a> [argocd\_chart\_version](#input\_argocd\_chart\_version) | Argocd helm chart version | `string` | `"5.43.3"` | no |
| <a name="input_argocd_image_tag"></a> [argocd\_image\_tag](#input\_argocd\_image\_tag) | Argocd docker image version | `string` | `"v2.8.0"` | no |
| <a name="input_argocd_password_bcrypted"></a> [argocd\_password\_bcrypted](#input\_argocd\_password\_bcrypted) | Bctypted password (hash) for argocd web ui | `string` | `""` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | Cert manager helm chart version | `string` | `"v1.5.4"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | DNS domain to create apps DNS records for applications | `string` | n/a | yes |
| <a name="input_enable_argocd"></a> [enable\_argocd](#input\_enable\_argocd) | Disable/enable ArgoCD addon | `bool` | `false` | no |
| <a name="input_enable_cert_manager"></a> [enable\_cert\_manager](#input\_enable\_cert\_manager) | Disable/enable cert manager | `bool` | `false` | no |
| <a name="input_enable_external_dns"></a> [enable\_external\_dns](#input\_enable\_external\_dns) | Disable/enable external dns | `bool` | `false` | no |
| <a name="input_enable_external_secrets"></a> [enable\_external\_secrets](#input\_enable\_external\_secrets) | Disable/enable external secrets | `bool` | `false` | no |
| <a name="input_enable_nginx"></a> [enable\_nginx](#input\_enable\_nginx) | Disable/enable Nginx Ingress | `bool` | `false` | no |
| <a name="input_enable_reloader"></a> [enable\_reloader](#input\_enable\_reloader) | Disable/enable reloader | `bool` | `false` | no |
| <a name="input_external_dns_version"></a> [external\_dns\_version](#input\_external\_dns\_version) | External dns helm chart version | `string` | `"6.5.6"` | no |
| <a name="input_external_secrets_version"></a> [external\_secrets\_version](#input\_external\_secrets\_version) | External secrets helm chart version | `string` | `"0.9.4"` | no |
| <a name="input_gke_ca_certificate"></a> [gke\_ca\_certificate](#input\_gke\_ca\_certificate) | gke cluster ca certificate | `string` | `""` | no |
| <a name="input_gke_endpoint"></a> [gke\_endpoint](#input\_gke\_endpoint) | gke cluster host endpoint | `string` | `""` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | Ingress nginx helm chart version | `string` | `"4.2.5"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | google project id | `string` | `""` | no |
| <a name="input_reloader_version"></a> [reloader\_version](#input\_reloader\_version) | Reloader chart version | `string` | `"v0.0.118"` | no |

## Outputs

No outputs.
