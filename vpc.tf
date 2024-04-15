resource "aws_vpc" "jenkins-vpc" {
  cidr_block = "172.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "Jenkins_vpc"
  } 
}

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.jenkins-vpc.id 
    cidr_block = "172.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true 
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.jenkins-vpc.id 
    cidr_block = "172.0.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true 
}

resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.jenkins-vpc.id 
}