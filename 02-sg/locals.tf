locals {
  project_name="roboshop"
  env="dev"
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  mongo_sg_id=module.mongodb.sg_id
  redis_sg_id=module.redis.sg_id
  mysql_sg_id=module.mysql.sg_id
  rabbitmq_sg_id=module.rabbitmq.sg_id
  catalogue_sg_id=module.catalogue.sg_id
  user_sg_id=module.user.sg_id
  cart_sg_id=module.cart.sg_id
  shipping_sg_id=module.shipping.sg_id
  payments_sg_id=module.payments.sg_id
  dispatch_sg_id=module.dispatch.sg_id
  web_sg_id=module.web.sg_id


}

locals {
  ingress_rules=[
    {
      ingress_type             = "ingress"
      from_port                = 27017
      to_port                  = 27107
      protocol                 = "tcp"
      security_group_id        = local.mongo_sg_id
      source_security_group_id = local.catalogue_sg_id
    },
    {
      ingress_type             = "ingress"
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      security_group_id        = local.mongo_sg_id
      source_security_group_id = local.user_sg_id
    },
    # Add more rules as needed
  ]
}