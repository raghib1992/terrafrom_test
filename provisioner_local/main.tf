resource "aws_instance" "test" {
  ami = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
  tags = {
    Name = "test"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.test.private_ip} >> ptivate_ips.txt"
  }
}



