module "tf_vpc" {
  source = "./modules/vpc"
}
module "tf_ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.tf_vpc.vpc_id
  subnet_id = module.tf_vpc.pub_sub_id
}
module "tf_LB" {
  source      = "./modules/loadbalancer"
  subnets     = module.tf_vpc.pub_sub_id
  sg_id       = module.tf_ec2.sg_id
  vpc_id      = module.tf_vpc.vpc_id
  instance_id = module.tf_ec2.ec2_id
  
}