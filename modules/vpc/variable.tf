variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "vpc_tags" {
  default = {
    Name = "TF_VPC"
  }
}
variable "pub_cidrs" {
  description = "CIDR Blocks for subnets"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}
variable "azs" {
  description = "availability zones"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}