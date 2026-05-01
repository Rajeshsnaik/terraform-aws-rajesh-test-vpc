# vpc
output "vpc_id" {
  value = aws_vpc.name.id
}

locals {
  #to format the subnet IDs which may be multiples in format of subnet_name={id=,az=}
  public_subnet_output = {
    for key, config in local.public_subnet : key => {
      subnet_id = aws_subnet.name[key].id
      az        = aws_subnet.name[key].availability_zone
    }
  }
  #private subnet output
  private_subnet_output = {
    for key, config in local.private_subnet : key => {
      subnet_id = aws_subnet.name[key].id
      az        = aws_subnet.name[key].availability_zone
    }
  }
}

#subnet details
output "public_subnets" {
  value = local.public_subnet_output
}

#private subnet details
output "private_subnets" {
  value = local.private_subnet_output
}
