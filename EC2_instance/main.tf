resource "aws_instance" "test" {
  ami = "ami-0470e33cd681b2476"
  instance_type = "t2.micro"
}
