module "humanitecvars" {
  source = "github.com/liantisit-iac-modules/humanitecvars?ref=v1"
}

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "~> 0.4"
}