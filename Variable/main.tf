resource "aws_instance" "test" {
  ami = lookup(var.AMIS, var.region)
  instance_type = "t2.micro"
}
