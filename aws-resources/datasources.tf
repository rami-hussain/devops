data "aws_vpc" "my-vpc" {
  state = "available"

  filter {
    name   = "tag:Environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:Name"
    values = ["my-vpc"]
  }

}



data "aws_subnet" "private_subnets" {
  vpc_id = data.aws_vpc.my-vpc.id

  filter {
    name   = "tag:Environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:Name"
    values = ["my-vpc-private-eu-west-1b"]
  }

#   filter {
#     name   = "tag:Product"
#     values = [var.product]
#   }
}


 data "aws_subnet" "public_subnet_a" {
 vpc_id = data.aws_vpc.my-vpc.id

  filter {
    name   = "tag:Environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:Name"
    values = ["my-vpc-public-eu-west-1a"]
  }

#   filter {
#     name   = "tag:Product"
#     values = [var.product]
#   }
 }

 data "aws_subnet" "public_subnet_b" {
vpc_id = data.aws_vpc.my-vpc.id

  filter {
    name   = "tag:Environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:Name"
    values = ["my-vpc-public-eu-west-1b"]
  }

#   filter {
#     name   = "tag:Product"
#     values = [var.product]
#   }
 }

# data "aws_ami" "amazon_linux_2" {
#   most_recent = true

#   owners = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }

# }

# ########### USER DATA ############
# data "template_file" "bastion_userdata" {
#   template = file("${path.module}/templates/bastion-userdata.tpl")
# }