#################################
# Security group with fixed name
#################################
module "fixed_name_sg" {
  source = "../modules/terraform-aws-security-group"

  name        = "fixed-name-sg"
  description = "Security group with fixed name"
  vpc_id      = data.aws_vpc.my-vpc.id

  use_name_prefix = false

  ingress_cidr_blocks = ["10.0.0.0/16","0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]
}