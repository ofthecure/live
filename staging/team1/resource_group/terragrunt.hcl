terraform {
    source = "git::ssh://git@github.com/ofthecure/modules.git//azure-resource-group" 
}

inputs = {
    name = "Kubernetes"
}
