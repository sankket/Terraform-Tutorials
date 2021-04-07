# Create and Attach internet gateway

resource "aws_internet_gateway" "dfsc-igw" {
  #we need to attach internet gateway to vpc.
  vpc_id = aws_vpc.dfsc_vpc.id
  tags = {
    Name        = "DFSC Internet Gateway"
    Terraform   = "true"
  }
}
