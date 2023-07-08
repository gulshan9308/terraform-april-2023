resource "group3" "main" {
  cidr_block = var.cidr_vpc
}

resource "group3" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_public1
  map_public_ip_on_launch = true
  availability_zone = "${var.region}a"      
}


resource "group3" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_public2
  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"    
}

resource "group3" "public3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_public3
  map_public_ip_on_launch = true
  availability_zone = "${var.region}c"    
}

resource "group3" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_private1
  availability_zone = "${var.region}a"
}

resource "group3" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_private2
  availability_zone = "${var.region}b"
}

resource "group3" "private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_private3
  availability_zone = "${var.region}c"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = group3.main.id
  route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = group3.main1.id
  route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = group3.main2.id
  route_table_id = aws_route_table.r.id
}