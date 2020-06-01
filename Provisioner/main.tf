resource "aws_instance" "test1" {
  ami = lookup(var.AMIS, var.region)
  instance_type = "t2.micro"
  key_name = "pro_key"
}

resource "aws_eip" "eip" {
  instance = "aws_instance.test1.id"
}

output "myeip" {
  value = "aws_eip.eip.public_ip"
}

resource "null_resource" "ssh_connection" {
  connection {
    host = "aws_eip.eip.pubic_ip"
    type = "ssh"
    port = 22
    user = "ec2-user"
    private_key = file(pro_key.pem)
    timeout = "1m"
    agent = "false"
  }

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
}
