resource "azurerm_resource_group" "sagar-test-deployment" {
  name = "${var.resource_name}-${var.env}"
  location = var.location
  tags = {
    environment = var.env
  }
}