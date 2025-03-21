module "resource_group" {
    source = "./resource_group"
    resource_name = "${resource_name}"
    env = "${env}"
    location = "${location}"
}
