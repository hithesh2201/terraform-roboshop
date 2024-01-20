resource "aws_ssm_parameter" "security_group_id" {
  name  = "/roboshop/dev/ansible_sg_id"
  type  = "String"
  value = aws_security_group.ansible_server.id
}