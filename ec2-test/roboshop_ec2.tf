resource "aws_instance" "roboshop" {
  # count= length(var.instances_name)
  for_each = var.instance  
  ami           = "ami-03265a0778a880afb"
  instance_type = each.value[0]
  subnet_id = each.value[2]
  vpc_security_group_ids =  [each.value[1]]
   tags = merge(
                {Name = each.key},
                local.common_tags      # { {},{},{},{}}
                )
}
resource "aws_route53_record" "www" {
  # count   = length(var.instances_name)
  for_each = aws_instance.roboshop
  zone_id = var.hosted_zone_id
  name    = each.key != "web" ? "${each.key}.${var.domain_path}" : "${var.domain_path}"
  type    = "A" #ipv4 address
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}

resource "aws_instance" "ansible_server" {
  ami           = "ami-03265a0778a880afb"
   instance_type = each.value[0]
   subnet_id = "subnet-0edf18e45106024f4"
   vpc_security_group_ids =  [aws_security_group.ansible_server.id]
  tags = merge(
                {Name ="ansible-server"},
                local.common_tags      # { {},{},{},{}}
                )
}


resource "aws_security_group" "ansible_server" {
  name        = "ansible-master"
  description = "Security group allowing SSH traffic only"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}
