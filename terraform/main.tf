provider "aws" {
  region     = "us-west-2"
  access_key = "####"
  secret_key = "#####"

}

variable "region" {
  default = "us-west-2"
}
 
variable "ami_id" {
  type = map
  default = {
    us-west-2    = "ami-09889d8d54f9e0a0e"
  }
}

resource "aws_instance" "jenkins-master-server" {
  ami           = "${lookup(var.ami_id, var.region)}"
  instance_type = "t2.micro"
  key_name      = "linuxKP"
  connection {
    type     = "ssh"
    user        = "ubuntu"
    private_key = "linuxKP"
    host = "${aws_instance.jenkins-master-server.public_ip}"
  }
 
  provisioner "file" {
    source      = "script/install.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "/tmp/install.sh",
    ]
  }

tags =  {
    Name = "Jenkins_Master"
    }
}

resource "aws_instance" "jenkins-slave-server" {
  ami           = "${lookup(var.ami_id, var.region)}"
  instance_type = "t2.micro"
  key_name      = "linuxKP"

 connection {
    user        = "ubuntu"
    private_key = "linuxKP"
    host = "${aws_instance.jenkins-slave-server.public_ip}"

  }

  tags =  {
    Name = "Jenkins_slave"
    }
}

