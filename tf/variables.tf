variable "region" {
  default = "us-east-1"
}
variable "subnet1" {
  default = "subnet-dcb1b1f2"
}
variable "subnet2" {
  default = "subnet-42629d4c"
}

variable "vpc_id" {
  default = "vpc-b3affec9"
}
variable "vpc_cidr" {
  default = "198.168.0.0/16"
}

variable "subnet_cidr" {
  type = list(string)
  default = ["172.31.80.0/24", "172.31.48.0/24"]
}

variable "access_key" {
  type = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type = string
  description = "AWS Secret Key"
}

data "aws_availability_zones" "azs" {}


