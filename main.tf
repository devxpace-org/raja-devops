provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "Rajavpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
    Name = "Rajavpc"
    }
}

resource "aws_subnet" "RCPublicSubnet1" {
    vpc_id = aws_vpc.Rajavpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
    Name = "RCPublicSubnet1"
    } 
}

resource "aws_subnet" "RCPublicSubnet2" {
    vpc_id = aws_vpc.Rajavpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
    Name = "RCPublicSubnet2"
    } 
}

resource "aws_subnet" "RCPrivateSubnet1" {
    vpc_id = aws_vpc.Rajavpc.id
    cidr_block = "10.0.2.0/24"
    tags = {
    Name = "RCPrivateSubnet1"
    } 
}

resource "aws_subnet" "RCPrivateSubnet2" {
    vpc_id = aws_vpc.Rajavpc.id
    cidr_block = "10.0.3.0/24"
    tags = {
    Name = "RCPrivateSubnet2"
    }
}

resource "aws_internet_gateway" "rajaig" {
    vpc_id = aws_vpc.Rajavpc.id
    tags = {
    Name = "rajaig"
    }
}

# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.Rajavpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rajaig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate public route table with public subnets
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.RCPublicSubnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.RCPublicSubnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Elastic IPs
resource "aws_eip" "nat_eips" {
  count = 2
  vpc = true

  tags = {
    Name = "NAT EIP ${count.index + 1}"
  }
}

# NAT Gateways
resource "aws_nat_gateway" "rajanatgateway" {
  count = 2

  allocation_id = aws_eip.nat_eips[count.index].id
  subnet_id     = aws_subnet.RCPublicSubnet1.id

  tags = {
    Name = "NAT Gateway ${count.index + 1}"
  }
}
resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.Rajavpc.id
  tags = {
    Name = "PrivateRT1"
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.Rajavpc.id
  tags = {
    Name = "PrivateRT2"
  }
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.RCPrivateSubnet1.id
  route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.RCPrivateSubnet2.id
  route_table_id = aws_route_table.private_route_table_2.id
}

resource "aws_route" "private_subnet_1_nat_route" {
  route_table_id         = aws_route_table.private_route_table_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.rajanatgateway[0].id
}

resource "aws_route" "private_subnet_2_nat_route" {
  route_table_id         = aws_route_table.private_route_table_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.rajanatgateway[1].id
}
