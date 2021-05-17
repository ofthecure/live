include {
  path = find_in_parent_folders()
}

terraform {
    source = "git::ssh://git@github.com/ofthecure/modules.git//azure-registry"
}

inputs = {
    environment = "cloudplatform"
    location = "eastus"
    name_postfix = "01"
    resource_group = "rg-cloudplatform-shared-01"
}
