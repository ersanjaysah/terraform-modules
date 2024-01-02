module "dev-ec2-setup" {
  source = "../modules/ec2/"
  tag_name = var.tagname_p1
  instance_type_ami = var.instance_type_ami_p1
  ports = var.ports_p1
}