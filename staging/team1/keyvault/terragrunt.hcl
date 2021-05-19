locals {
    team_vars = read_terragrunt_config(find_in_parent_folders("team.hcl"))

    team = local.team_vars.locals.team
}

terraform {
    source = "git::ssh://git@github.com/ofthecure/modules.git//azure-keyvault" 
}

dependency "rg" {
    config_path = "../resource_group"

    mock_outputs = {
        resource_group = {
            name = "mock_name"
            location = "eastus"
        }
    }
}

inputs = {
    resource_group = dependency.rg.outputs.resource_group
    team = local.team
    environment = "staging"
}
