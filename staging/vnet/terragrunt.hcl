include {
    path = find_in_parent_folders()
}

terraform {
    source = "git::ssh://git@github.com/ofthecure/modules.git//azure-vnet"
}

inputs = {
    environment = "staging"
    location = "eastus"
    name_postfix = "01"
    resource_group = "rg-cloudplatform-staging-01"
    address_space = ["10.1.0.0/16"]
    subnet_address_space = "10.1.0.0/22"
}
