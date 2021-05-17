remote_state {
    backend = "azurerm"
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite"
    }
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "Kubernetes"
        storage_account_name = "sttfstatecloudpoc"
        container_name = "tfstate"
    }
}
