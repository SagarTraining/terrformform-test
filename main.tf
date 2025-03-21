module "resource_group" {
    source = "../terrformform-test/resource_group"
    resource_name = "${resource_name}"
    env = "${env}"
    location = "${location}"
}
