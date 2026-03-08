data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
filter {
  name = "cidr"
  values = ["172.31.0.0/16"]
}
}

/* output "azs_info" {
    value = data.aws_availability_zones.available
} */

data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name = "association.main"
    values = ["true"]
  }
}
