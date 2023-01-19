resource "aws_internet_gateway" "gateway" {
  vpc_id =  aws_vpc.terra-vpc.id

  tags = {
   Name = var.igw_name
  }
}