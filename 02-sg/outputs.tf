output "vpc_id" {
    value = data.aws_ssm_parameter.vpc_id.value
    sensitive = true

  
}

output "mongo_sg_id" {
    value = module.mongodb.sg_id
  
}