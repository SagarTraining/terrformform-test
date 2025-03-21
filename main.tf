module "resource_group" {
    source = "./resource_group"
    resource_name = var.resource_name
    env = var.env
    location = var.location
}
