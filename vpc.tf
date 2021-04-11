# Define VPC Variable

variable "aws-vpc-cidr" {
  type= string
  #this is cidr block. it will have around 65k addresses.
  default="10.0.0.0/16"
}

# Create VPC

resource "aws_vpc" "dfsc_vpc" {
  cidr_block = var.aws-vpc-cidr
  instance_tenancy = "default"
  tags = {
    Name = "DFSC VPC"
    Terrafrom = "True"
  }
}
# tags are created to identify the resources.
