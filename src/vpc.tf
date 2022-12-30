
#create vpc, igw, route-table here
resource "aws_vpc" "vpc_id" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"tags = {
    Name = "Demo VPC"
  }
}

resource "aws_internet_gateway" "demogateway" {
  vpc_id = "${aws_vpc.vpc_id.id}"
}

# Route Table
resource "aws_route_table" "route" {
    vpc_id = "${aws_vpc.vpc_id.id}"
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.demogateway.id}"
    }
tags = {
        Name = "Route to internet"
    }
}
# Associating Route Table
resource "aws_route_table_association" "rt1" {
    subnet_id = "${aws_subnet.demosubnet.id}"
    route_table_id = "${aws_route_table.route.id}"
}