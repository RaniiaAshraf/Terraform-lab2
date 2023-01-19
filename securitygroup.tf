resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.terra-vpc.id

  ingress {
    from_port        = 80 
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.route-cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.route-cidr]
  }

  tags = {
    Name =  var.security-name
  }
}