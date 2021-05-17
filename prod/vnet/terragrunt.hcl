include {
    path = find_in_parent_folders()
}

terraform {
    source = "git::ssh://git@github.com/ofthecure/modules.git//azure-vnet?ref=v0.0.1"
}

inputs = {
    environment = "prod"
    location = "eastus"
    name_postfix = "01"
    resource_group = "rg-cloudplatform-prod-01"
    address_space = ["10.1.0.0/16"]
    subnet_address_space = "10.1.0.0/22"
}
