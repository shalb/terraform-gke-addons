# GCP GKE Terraform Module

Terraform module that install core addons in GKE cluster:

1. ingress-nginx
2. external-dns
3. external-secrets
4. cert-manager


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
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.80.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager_workload_identity"></a> [cert\_manager\_workload\_identity](#module\_cert\_manager\_workload\_identity) | terraform-google-modules/kubernetes-engine/google//modules/workload-identity | ~> 27.0.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cluster_issuer_letsencrypt_production](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.ingress_nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.reloader](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [random_id.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_client_config.client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | Cert manager helm chart version | `string` | `"v1.5.4"` | no |
| <a name="input_cluster-name"></a> [cluster-name](#input\_cluster-name) | gke cluster name | `string` | `""` | no |
| <a name="input_enable_cert_manager"></a> [enable\_cert\_manager](#input\_enable\_cert\_manager) | Disable/enable cert manager | `bool` | `false` | no |
| <a name="input_enable_external_secrets"></a> [enable\_external\_secrets](#input\_enable\_external\_secrets) | Disable/enable external secrets | `bool` | `false` | no |
| <a name="input_enable_nginx"></a> [enable\_nginx](#input\_enable\_nginx) | Disable/enable Nginx Ingress | `bool` | `false` | no |
| <a name="input_enable_reloader"></a> [enable\_reloader](#input\_enable\_reloader) | Disable/enable reloader | `bool` | `false` | no |
| <a name="input_external_secrets_version"></a> [external\_secrets\_version](#input\_external\_secrets\_version) | External secrets helm chart version | `string` | `"0.9.4"` | no |
| <a name="input_gke_ca_certificate"></a> [gke\_ca\_certificate](#input\_gke\_ca\_certificate) | gke cluster ca certificate | `string` | `""` | no |
| <a name="input_gke_endpoint"></a> [gke\_endpoint](#input\_gke\_endpoint) | gke cluster host endpoint | `string` | `""` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | Ingress nginx helm chart version | `string` | `"4.2.5"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | google project id | `string` | `""` | no |
| <a name="input_reloader_version"></a> [reloader\_version](#input\_reloader\_version) | Reloader chart version | `string` | `"v0.0.118"` | no |

## Outputs

No outputs.
