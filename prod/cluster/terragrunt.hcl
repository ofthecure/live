include {
    path = find_in_parent_folders()
}

terraform {
    source = "git::ssh://git@github.com/ofthecure/modules.git//aks-cluster?ref=v0.0.1" 
}
// Unfortunately, we have to use a real acr id here even though its mocked 
dependency "registry" {
    config_path = "../../global/registry"

    mock_outputs = {
        id = ""
    }
    skip_outputs = true
}
// Unfortunately, we have to use a real subnet id here even though its mocked 
dependency "vnet" {
    config_path = "../vnet"
    mock_outputs = {
        subnet_id = ""
    }
    skip_outputs = true
}

dependencies {
    paths = [
        "../vnet",
        "../../global/registry"
    ]
}  

inputs = {
    environment = "prod"
    location = "eastus"
    name_postfix = "01"
    resource_group = "rg-cloudplatform-prod-01"
    container_registry_id = dependency.registry.outputs.id
    vnet_subnet_id = dependency.vnet.outputs.subnet_id
    default_node_pool = {
        node_count = 1
    }
}
