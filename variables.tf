variable "region_map" {
  type = map(any)
  default = {
    sk1 = "ap-northeast-2"
    eu1 = "eu-west-1"
    in1 = "ap-south-1"
    sg1 = "ap-southeast-1"
    us1 = "us-west-2"
  }
}

variable "data_centers" {
  type    = set(string)
  default = ["sk1","eu1", "in1", "sg1", "us1"]
}

variable "region_first_two_octet_map" {
  type = map(any)
  default = {
    sk1 = "10.14"
    eu1 = "10.11"
    in1 = "10.12"
    sg1 = "10.15"
    us1 = "10.16"
  }
}
