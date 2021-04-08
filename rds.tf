# CREATE RDS SECURITY GROUP

resource "aws_security_group" "dfsc_db_sg" {
  name = "DFSC RDS Security Group"
  vpc_id = aws_vpc.dfsc_vpc.id
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [
      aws_security_group.dfsc_asg_sg.id
    ]
  }
  tags = {
    Name        = "RDS Security Group"
    Terraform   = "true"
  }
}

# Create DFSC Database Subnet Group

resource "aws_db_subnet_group" "dfsc-db-subnet" {
  name = "dfsc-database-subnet-group"
  subnet_ids = [
    aws_subnet.dfsc-private-1a.id,
    aws_subnet.dfsc-private-1b.id
    ]

  tags = {
    Name        = "DB Subnet Group"
    Terraform   = "true"
  }
}

# Create DFSC Database Instance 

resource "aws_db_instance" "dfsc-db" {
  allocated_storage       = "10"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.6"
  multi_az                = "true"
  instance_class          = "db.t2.micro"
  name                    = "magento"
  username                = "admin"
  password                = var.db-master-password
  identifier              = "dfsc-database"
  skip_final_snapshot     = "true"
  backup_retention_period = "7"
  port                    = "3306"
  storage_encrypted       = "false"
  db_subnet_group_name    = aws_db_subnet_group.dfsc-db-subnet.name
  vpc_security_group_ids  = [aws_security_group.dfsc_db_sg.id]
   tags = {
    Name        = "DFSC Database"
    Terraform   = "true"
  }
}{"threads":[{"position":822,"start":0,"end":821,"connection":"closed"},{"position":822,"start":822,"end":1641,"connection":"open"}],"url":"https://att-b.udemycdn.com/2020-10-04_17-44-35-d0191cb64762062148af38e1264ac885/original.tf?secure=P371f91HMTLKhmaAigzVkw%3D%3D%2C1604181340&filename=rds.tf","method":"GET","port":443,"downloadSize":1641,"headers":{"date":"Sat, 31 Oct 2020 17:27:32 GMT","content-type":"binary/octet-stream","content-length":"1641","connection":"close","x-amz-id-2":"zMrxsXy/Thzo0rFgHyMmas7OXkAZYtHVyN6MrCX2nIsY3/cU8oBZ4MpTt5pQvylv37pB6EgAb2c=","x-amz-request-id":"0AADE34577C380D0","last-modified":"Sun, 04 Oct 2020 17:44:37 GMT","etag":"\"f1e7bcbb9b7d2059a22608fc09761225\"","x-amz-server-side-encryption":"AES256","x-amz-meta-qqfilename":"rds.tf","x-amz-version-id":"mbWSqNw7ZNELCtlnmXV8k7ZKYMqHepHi","x-77-nzt":"A7k73AEoGMCxuZhBUxqYdO/SqwEAj/Q6gbGMz8E=","x-edge-ip":"143.244.58.129","x-edge-pop":"pragueCZ","expires":"Wed, 11 Nov 2020 11:02:10 GMT","cache-control":"max-age=31536000","content-disposition":"attachment; filename=\"rds.tf\"","x-lb-ip":"185.152.65.83, 185.59.220.1","x-lb-pop":"pragueCZ, frankfurtDE","x-cache-lb":"HIT, MISS","x-age-lb":"109522","server":"CDN77-Turbo","accept-ranges":"bytes"}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
