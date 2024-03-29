data "aws_ssm_parameter" "vpc_id" {
  name = "/${local.project_name}/${local.env}/vpc_id"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_ssm_parameter" "mongo_sg_id" {
  name = "/${local.project_name}/${local.env}/mongo_sg_id"
}


data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${local.project_name}/${local.env}/redis_sg_id"
}


data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${local.project_name}/${local.env}/mysql_sg_id"
}
data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${local.project_name}/${local.env}/rabbitmq_sg_id"
}
data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${local.project_name}/${local.env}/catalogue_sg_id"
}
data "aws_ssm_parameter" "cart_sg_id" {
  name = "/${local.project_name}/${local.env}/cart_sg_id"
}
data "aws_ssm_parameter" "user_sg_id" {
  name = "/${local.project_name}/${local.env}/user_sg_id"
}
data "aws_ssm_parameter" "shipping_sg_id" {
  name = "/${local.project_name}/${local.env}/shipping_sg_id"
}
data "aws_ssm_parameter" "payments_sg_id" {
  name = "/${local.project_name}/${local.env}/payments_sg_id"
}
data "aws_ssm_parameter" "web_sg_id" {
  name = "/${local.project_name}/${local.env}/web_sg_id"
}
