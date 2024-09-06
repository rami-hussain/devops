module "ec2_instance" {
  source  = "../modules/terraform-aws-ec2-instance/"

  name = "single-instance"

  instance_type          = "t2.micro"
  #key_name               = "user1"
  monitoring             = false
  vpc_security_group_ids = [module.fixed_name_sg.security_group_id]   #["sg-12345678"]
  subnet_id              = data.aws_subnet.private_subnets.id
  ami = "ami-03cc8375791cb8bcf"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}