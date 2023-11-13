module "vpc" {
  for_each = var.data_centers
  source                       = "./modules/vpc"
  region                       = var.region_map["${each.value}"]
  project_name                 = "${each.value}-dummy_project"
  vpc_cidr                     = "${var.region_first_two_octet_map["${each.value}"]}.0.0/16"
  public_subnet_az1_cidr       = "${var.region_first_two_octet_map["${each.value}"]}.0.0/24"
  public_subnet_az2_cidr       = "${var.region_first_two_octet_map["${each.value}"]}.1.0/24"
  private_subnet_az1_cidr      = "${var.region_first_two_octet_map["${each.value}"]}.2.0/24"
  private_subnet_az2_cidr      = "${var.region_first_two_octet_map["${each.value}"]}.3.0/24"
  private_data_subnet_az1_cidr = "${var.region_first_two_octet_map["${each.value}"]}.4.0/24"
  private_data_subnet_az2_cidr = "${var.region_first_two_octet_map["${each.value}"]}.5.0/24"
}