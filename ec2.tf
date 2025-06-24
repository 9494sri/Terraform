
 resource "aws_instance" "this"{

    ami = "ami-09c813fb71547fc4f"

    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    instance_type = "t2.micro"

    tags = {

        Name = "terraform-demo"
        Purpose = "terraform-practice"
    }

}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
 

   ingress {
    from_port       = 22   
    to_port         = 22    
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0   
    to_port         = 0    
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_tls"
  }
}

/*

This Terraform configuration defines two resources:

1. **aws_instance.this**:
    - Creates an EC2 instance using the specified AMI (`ami-09c813fb71547fc4f`) and instance type (`t2.micro`).
    - Associates the instance with a security group (`aws_security_group.allow_tls`) to manage network access.
    - Tags the instance with `Name` as "terraform-demo" and `Purpose` as "terraform-practice".

2. **aws_security_group.allow_tls**:
    - Creates a security group named "allow_tls" to manage inbound and outbound traffic.
    - Inbound rules:
      - Allows SSH traffic (TCP port 22) from any IP address (`0.0.0.0/0`).
    - Outbound rules:
      - Allows all traffic (`protocol = "-1"`) to any IP address (`0.0.0.0/0`).
    - Tags the security group with `Name` as "allow_tls".

This configuration is intended for practice purposes and demonstrates basic EC2 instance creation and security group setup in Terraform.
*/