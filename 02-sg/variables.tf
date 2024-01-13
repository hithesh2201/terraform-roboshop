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