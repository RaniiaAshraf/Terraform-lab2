resource "aws_vpc" "terra-vpc" {
  cidr_block =  var.vpc-id
  tags = {
    Name = "terra-vpc"
  }
}


#subnet
resource "aws_subnet" "subnet" {
  cidr_block = var.subnet-cidr[count.index]
  count=length(var.subnet-cidr)
  vpc_id = aws_vpc.terra-vpc.id
   tags = {
    Name = var.subnet-name[count.index]
  }
}