module "mongodb" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-mongodb"
    sg_description = "${local.project_name}-${local.env}-mongodb"
    vpc_id = local.vpc_id
  
}

module "vpn" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-vpn"
    sg_description = "${local.project_name}-${local.env}-vpn"
    vpc_id =data.aws_vpc.default.id
  
}

resource "aws_security_group_rule" "allowing_vpn_to_all" {
  count=length(local.sg_ids)
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = local.sg_ids[count.index]
  source_security_group_id = module.vpn.sg_id
   description              = "Inbound Rule to connect with vpn"
}
module "redis" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-redis"
    sg_description = "${local.project_name}-${local.env}-redis"
    vpc_id = local.vpc_id
  
}
module "mysql" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-mysql"
    sg_description = "${local.project_name}-${local.env}-mysql"
    vpc_id = local.vpc_id
  
}
module "rabbitmq" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-rabbitmq"
    sg_description = "${local.project_name}-${local.env}-rabbitmq"
    vpc_id = local.vpc_id
  
}
module "catalogue" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-catalogue"
    sg_description = "${local.project_name}-${local.env}-catalogue"
    vpc_id = local.vpc_id
  
}
module "cart" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-cart"
    sg_description = "${local.project_name}-${local.env}-cart"
    vpc_id = local.vpc_id
  
}
module "user" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-user"
    sg_description = "${local.project_name}-${local.env}-user"
    vpc_id = local.vpc_id
  
}

module "shipping" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-shipping"
    sg_description = "${local.project_name}-${local.env}-shipping"
    vpc_id = local.vpc_id
  
}

module "payments" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-payments"
    sg_description = "${local.project_name}-${local.env}-payments"
    vpc_id = local.vpc_id
  
}
module "dispatch" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-dispatch"
    sg_description = "${local.project_name}-${local.env}-dispatch"
    vpc_id = local.vpc_id
  
}
module "web" {
    source = "../../terraform-sg"
    sg_name = "${local.project_name}-${local.env}-web"
    sg_description = "${local.project_name}-${local.env}-web"
    vpc_id = local.vpc_id
  
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
  source_security_group_id = module.catalogue.sg_id
   description              = "Inbound Rule from Catalogue"
}
resource "aws_security_group_rule" "mongodb_user" {
  
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
  source_security_group_id = module.user.sg_id
   description              = "Inbound Rule from user"
}

resource "aws_security_group_rule" "redis_user" {
  
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
  source_security_group_id = module.user.sg_id
   description              = "Inbound Rule from user"
}

resource "aws_security_group_rule" "redis_cart" {
  
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
  source_security_group_id = module.cart.sg_id
   description              = "Inbound Rule from cart"
}

resource "aws_security_group_rule" "mysql_shipping" {
  
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.mysql.sg_id
  source_security_group_id = module.shipping.sg_id
   description              = "Inbound Rule from shipping"
}

resource "aws_security_group_rule" "rabbitmq_payments" {
  
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.rabbitmq.sg_id
  source_security_group_id = module.payments.sg_id
   description              = "Inbound Rule from payments"
}

resource "aws_security_group_rule" "catalogue_web" {
  
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.catalogue.sg_id
  source_security_group_id = module.web.sg_id
   description              = "Inbound Rule from web"
}

resource "aws_security_group_rule" "catalogue_cart" {
  
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.catalogue.sg_id
  source_security_group_id = module.cart.sg_id
   description              = "Inbound Rule from cart"
}



resource "aws_security_group_rule" "user_web" {
  
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.user.sg_id
  source_security_group_id = module.web.sg_id
   description              = "Inbound Rule from web"
}
resource "aws_security_group_rule" "cart_web" {
  
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart.sg_id
  source_security_group_id = module.web.sg_id
   description              = "Inbound Rule from web"
}
resource "aws_security_group_rule" "shipping_web" {
  
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.shipping.sg_id
  source_security_group_id = module.web.sg_id
   description              = "Inbound Rule from web"
}
resource "aws_security_group_rule" "payments_web" {
  
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.payments.sg_id
  source_security_group_id = module.web.sg_id
   description              = "Inbound Rule from web"
}
resource "aws_security_group_rule" "dispatch_web" {
  
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.dispatch.sg_id
  source_security_group_id = module.web.sg_id
   description              = "Inbound Rule from web"
}

resource "aws_security_group_rule" "web_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.web.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Inbound Rule from http"
}

resource "aws_security_group_rule" "vpn_from_public" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = module.vpn.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Inbound Rule from http"
}

resource "aws_security_group_rule" "web_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.web.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Inbound Rule from https"
}

resource "aws_security_group_rule" "web_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.web.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Inbound Rule from ssh"
}

# data "aws_security_groups" "existing_security_groups" {}

# resource "aws_security_group_rule" "allow_ssh" {
#   for_each = data.aws_security_groups.existing_security_groups.ids

#   type        = "ingress"
#   from_port   = 22
#   to_port     = 22
#   protocol    = "tcp"
#   security_group_id = each.value
# }



