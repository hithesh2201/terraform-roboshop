variable "public_cidr" {
  type= list
  default= ["10.0.1.0/24","10.0.2.0/24"]
  validation {
    condition     = length(var.public_cidr) ==2
    error_message = "You have to mention only two public subnets. "
  }
}

variable "private_cidr" {
  type= list
  default= ["10.0.11.0/24","10.0.12.0/24"]
  validation {
    condition     = length(var.private_cidr) ==2
    error_message = "You have to mention only two private subnets. "
  }
}

variable "availabilty_zones" {
  type= list
  default = ["us-east-1a","us-east-1b"]
   validation {
    condition     = length(var.availabilty_zones) ==2
    error_message = "You have to mention only two zones. "
  }
}