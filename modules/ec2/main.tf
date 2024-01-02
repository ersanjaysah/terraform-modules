resource "aws_instance" "myec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type_ami
  key_name                    = "jan"
  vpc_security_group_ids = [ aws_security_group.nginx_SG.id ]
  associate_public_ip_address = true

  tags = {
    Name = var.tag_name
  }
}

resource "aws_security_group" "nginx_SG" {
  name        = var.tag_name
  description = "this sg of nginx by tf"

  dynamic "ingress" {
    for_each = var.ports
    content {
      description = "inbound rule"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tag_name
  }
}