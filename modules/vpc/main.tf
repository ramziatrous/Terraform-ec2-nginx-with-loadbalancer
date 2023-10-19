
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = var.vpc_tags
}

resource "aws_subnet" "public" {
  count                   = length(var.pub_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-${count.index}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "TF Internet Gateway"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "TF Route Table"
  }
}

resource "aws_route_table_association" "rt_assosiation" {
  count          = length(var.pub_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rt.id
}
