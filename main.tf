module "resource_group" {
    source = "../terrform-test/resource_group"
}

terraform {
    backend "azurerm" {
        resource_group_name   = module.resource_group.resource_group_name
        storage_account_name  = "saistoragess"
        container_name        = "sagar-test-storage"
        key                   = "terraform.tfstate"
    }
}