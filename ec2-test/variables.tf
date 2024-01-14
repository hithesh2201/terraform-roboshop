
variable "vpc_security_group_ids" {
  default = ["sg-0e3c7192e6db9e9c4","sg-0f16b6da80b5fe5d2","sg-044a659586bedcab9","sg-01b024de58ba66f09","sg-05927c9c6115f7077","sg-008b97354e390222e","sg-0a2284ae5f03db073","sg-020309b63fd05c435","	sg-02cf99bd7d092c72d","	sg-00f0317764cf633d8","sg-091562defa0bedd61"]
  
}
# variable "instances_name" {
#   default = ["mongod", "mysql", "redis", "catalogue", "user", "cart", "shipping", "payments", "rabbitmq", "dispatch", "web"]
# }

variable "instance" {
  default = {
    mongod     = ["t3.small","sg-0e3c7192e6db9e9c4","subnet-0a9a5444dabf029a8"]  #key= value
    # mysql      = ["t3.small","sg-0f16b6da80b5fe5d2"]
    # shipping   = ["t3.small","sg-044a659586bedcab9"]
    # user    = ["t2.micro","sg-01b024de58ba66f09"]
    # cart    = ["t2.micro","sg-05927c9c6115f7077"]
    catalogue    = ["t2.micro","sg-01b024de58ba66f09","subnet-00285cfb639c95ab8"]
    # redis    = ["t2.micro","sg-0a2284ae5f03db073"]
    web    = ["t2.micro","sg-091562defa0bedd61","subnet-0edf18e45106024f4"]
    # rabbitmq    = ["t2.micro","sg-02cf99bd7d092c72d"]
    # payment    = ["t2.micro","sg-00f0317764cf633d8"]
    # dispatch    = ["t2.micro","sg-091562defa0bedd61"]
  }
}

variable "domain_path" {

  default = "hiteshshop.online"
}

variable "hosted_zone_id" {
  default = "Z0781952344MQ4MZCJ506"
}

variable "name" {
  type= string
  default = "roboshop-allow"
  
}
variable "description" {
  type= string
  default = "allowing all from internet"
  
}

variable "instance_name" {
  type= string
  default = "mongod"
  
}

