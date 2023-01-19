resource "aws_instance" "ec2_instance" {
    tags = {
        Name = var.ec2-pub 
    }
    ami = var.ami-id
    subnet_id = aws_subnet.subnet[0].id
    instance_type = "t2.micro"
    associate_public_ip_address = "true" 
    security_groups = [aws_security_group.allow_tls.id]
  
    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
    EOF

}
resource "aws_instance" "ec2_instance_priv" {
    tags = {
        Name = var.ec2-priv
    }
    ami = var.ami-id
    subnet_id = aws_subnet.subnet[1].id
    instance_type = "t2.micro"
    associate_public_ip_address = "false" 
    security_groups = [aws_security_group.allow_tls.id]
  
    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
    EOF

}