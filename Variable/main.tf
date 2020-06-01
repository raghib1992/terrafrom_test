resource "aws_instance" "test" {
  ami = lookup(var.AMIS, var.region)
  instance_type = "t2.micro"
  key_name = "pro_key"
  tags = {
    Name = "admin"
  }
}
