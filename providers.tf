provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
}

terraform {
    backend "azurerm" {
        resource_group_name   = "saigaru"
        storage_account_name  = "saistoragess"
        container_name        = "sagar-test-storage"
        key                   = "terraform-dev.tfstate"
    }
}
