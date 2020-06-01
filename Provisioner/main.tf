resource "aws_key_pair" "firstkey" {
  key_name = "firstkey"
  public_key = file(var.pub_key)  
}

resource "aws_instance" "test1" {
  ami = lookup(var.AMIS, var.region)
  instance_type = "t2.micro"
  key_name = aws_key_pair.firstkey.key_name

  Provisioner "file" {
      source = "wordpress.sh"
      destination = "/home/ec2-user/wordpress.sh"
  }

  Provisioner "remote-exec" {
    inline = [
      "sudo cp /home/ec2-user/wordpress.sh /tmp/wordpress.sh",
      "sudo chmod 777 /tmp/wordpress.sh",
      "sudo /tmp/wordpress.sh",
    ]

  }

  connection {
    user = "ec2-user"
    private_key = file(var.pri_key)
  }
}
