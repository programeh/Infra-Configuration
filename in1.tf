module "in1-vpc" {
  source                       = "./modules/vpc"
  region                       = var.region_map["in1"]
  project_name                 = "in1-dummy_project"
  vpc_cidr                     = "${var.region_first_two_octet_map["in1"]}.0.0/16"
  public_subnet_az1_cidr       = "${var.region_first_two_octet_map["in1"]}.0.0/24"
  public_subnet_az2_cidr       = "${var.region_first_two_octet_map["in1"]}.1.0/24"
  private_subnet_az1_cidr      = "${var.region_first_two_octet_map["in1"]}.2.0/24"
  private_subnet_az2_cidr      = "${var.region_first_two_octet_map["in1"]}.3.0/24"
  private_data_subnet_az1_cidr = "${var.region_first_two_octet_map["in1"]}.4.0/24"
  private_data_subnet_az2_cidr = "${var.region_first_two_octet_map["in1"]}.5.0/24"
}