# variable "sg_name" {
#     default = "${local.project_name}-${local.env}-mongodb"
  
# }

# variable "sg_description" {
#     default = "sg for mongodb"
  
# }
# variable "vpc_id" {
#     default= data.aws_ssm_parameter.vpc_id.value             ! # in variables we cant use data resource
# }

# variable "ingress_rules" {
#   type    = list(map(string))
#   default = [
#     {
#       ingress_type             = "ingress"
#       from_port                = 27017
#       to_port                  = 27107
#       protocol                 = "tcp"
#       security_group_id        = var.mongo_sg_id
#       source_security_group_id = var.catalogue_sg_id
#     },
#     {
#       ingress_type             = "ingress"
#       from_port                = 8080
#       to_port                  = 8080
#       protocol                 = "tcp"
#       security_group_id        = var.mongo_sg_id
#       source_security_group_id = var.user_sg_id
#     },
#     # Add more rules as needed
#   ]
# }

# variable "mongodb_sg_id" {
#     default = local.mongodb.sg_id
  
# }

# variable "catalogue_sg_id" {
#     default = local.catalogue.sg_id
  
# }
# variable "user_sg_id" {
#     default = local.user.sg_id
  
# }


# variable "sg_ids" {
#   type    = list
#   default = [module.mongodb.sg_id,module.redis.sg_id,module.mysql.sg_id,module.rabbitmq.sg_id,module.catalogue.sg_id,module.user.sg_id,module.cart.sg_id,module.shipping.sg_id,module.payments.sg_id,module.dispatch.sg_id,module.web.sg_id]  # Replace these with your actual security group IDs
# }

# variable "mongodb_sg_id" {
#   default = data.aws_ssm_parameter.mongo_sg_id.value
# }

