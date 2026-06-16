#key pair
resource aws_key_pair my_key {
    key_name = "terra-key-ec2"
    public_key = file("terra-key-ec2.pub")
             
}

#security group  and vpc

resource aws_default_vpc default_vpc {
  
}
resource aws_security_group my_Security_group {
    name = "automate-sg"
    description = "this is demo sg"
    vpc_id = aws_default_vpc.default_vpc.id
  
#inbound rules
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open"

}
ingress {
    from_port =80
    to_port =80
    protocol ="tcp"
    cidr_blocks =["0.0.0.0/0"]
    description = "http open"
}

#outbound rules
egress{
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
description = "all port open"


}
tags = {
    Name = "automate-sg"
  }

}

# ec2 instance
resource "aws_instance" "my_instance" {
 #   count = 3     count of machine 
    for_each = tomap({
        Amit-server-micro ="t3.micro"
        Amit-server-medium ="t3.micro"
    }) # meta argument
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_Security_group.name]
    instance_type = var.aws_instace_type
    ami = var.ec2_ami_id


    root_block_device {
      volume_size = var.env=="prd" ? 10 : var.ec2_default_root_storage_size
      volume_type = "gp3"
    }
    
    tags = {
      Name = each.key
  }
    
  
}
