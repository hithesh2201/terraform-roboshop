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
