resource "aws_vpc" "group3" {
  cidr_block = var.cidr_vpc
}

resource "aws_subnet" "group3_public1" {
  vpc_id     = aws_vpc.group3.id
  cidr_block = var.cidr_group3_public1
  map_public_ip_on_launch = true
  availability_zone = "${var.region}a"      
}


resource "aws_subnet" "group3_public2" {
  vpc_id     = aws_vpc.group3.id
  cidr_block = var.cidr_group3_public2
  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"    
}

resource "aws_subnet" "group3_public3" {
  vpc_id     = aws_vpc.group3.id
  cidr_block = var.cidr_group3_public3
  map_public_ip_on_launch = true
  availability_zone = "${var.region}c"    
}

resource "aws_subnet" "group3_private1" {
  vpc_id     = aws_vpc.group3.id
  cidr_block = var.cidr_group3_private1
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "group3_private2" {
  vpc_id     = aws_vpc.group3.id
  cidr_block = var.cidr_group3_private2
  availability_zone = "${var.region}b"
}

resource "aws_subnet" "group3_private3" {
  vpc_id     = aws_vpc.group3.id
  cidr_block = var.cidr_group3_private3
  availability_zone = "${var.region}c"
}

resource "aws_internet_gateway" "group3_gw" {
  vpc_id = aws_vpc.group3.id
}

resource "aws_route_table" "group3_r" {
  vpc_id = aws_vpc.group3.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.group3_gw.id
  }
}

resource "aws_route_table_association" "group3_a" {
  subnet_id      = aws_subnet.group3_public1.id
  route_table_id = aws_route_table.group3_r.id
}

resource "aws_route_table_association" "group3_b" {
  subnet_id      = aws_subnet.group3_public2.id
  route_table_id = aws_route_table.group3_r.id
}

resource "aws_route_table_association" "group3_c" {
  subnet_id      = aws_subnet.group3_public3.id
  route_table_id = aws_route_table.group3_r.id
}