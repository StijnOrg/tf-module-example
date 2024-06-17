module "humanitecvars" {
  source = "github.com/liantisit-iac-modules/humanitecvars?ref=v1"
  humanitec_resource_suffix = local.resource_suffix
}