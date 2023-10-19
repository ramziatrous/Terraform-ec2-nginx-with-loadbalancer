variable "ec2_instance_name" {
  type    = string
  default = "my_ec2_instance"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_instance_ami" {
  type    = string
  default = "ami-06dd92ecc74fdfb36"
}
variable "subnet_id" {

}
variable "vpc_id" {

}