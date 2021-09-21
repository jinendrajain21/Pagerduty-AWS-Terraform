##################Security-Group###############
variable "sg-ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80]
}

variable "SG-ports" {
  type        = list(number)
  description = "list of Egress ports"
  default     = [0]
}
resource "aws_security_group" "Pager-SG" {
  vpc_id      = aws_vpc.pager-vpc.id
  name        = "Pager-SG"
  description = "security group that allows ssh and all egress traffic"
  /*ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }*/

  dynamic "ingress" {
    for_each = var.sg-ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.SG-ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
