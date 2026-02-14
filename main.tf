resource "aws_instance" "dev-server" {

  ami = "ami-0b6c6ebed2801a5cb"

  instance_type = "t2.micro"

  key_name = "jenkins"

  tags = {

    Name = "dev-server"


  }



}

