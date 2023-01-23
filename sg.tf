resource "aws_security_group" "elb-sg-bean" {
  name = "elb-sg-bean"
  vpc_id = module.vpc.vpc_id
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "outbound"
    from_port = 0
    protocol = "-1"
    to_port = 0
  } ]

  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "inbound rules"
    from_port = 80
    protocol = "tcp"e
    to_port = 80
  } ]
}

resource "aws_security_group" "bastion-sg" {
  name = "bastion-sg"
  vpc_id = module.vpc.vpc_id
  egress{
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  ingress = [ {
    cidr_blocks = [ var.bastion_ip ]
    description = "outbound"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  } ]
}

resource "aws_security_group" "bs-instance-sg" {
  name = "bean-instance-sg"
  vpc_id = module.vpc.id
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  } ]
  ingress = [ {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    aws_security_group = [aws_security_group.bastion-sg.id]
  } ]
}

resource "aws_security_group" "backend-sg" {
  name = "bean-instance-sg"
  vpc_id = module.vpc.id
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  } ]
  ingress = [ {
    from_port = 0
    protocol = "-1"
    to_port = 0
    aws_security_group = [aws_security_group.bs-instance-sg.id]
  } ]
}

resource "aws_security_group_rule" "sec_group_allow_itself" {
  type = ingress
  from_port = 0
  to_port = 0
  protocol = "tcp"
  security_group_id = aws_security_group.backend-sg.id
  source_security_group_id = aws_security_group.backend-sg.id
}