provider "aws" {
  region = "eu-west-2"
  access_key = "AKIAIDTHKLKLBFSLXJ6Q"
  secret_key = "iCkixzWFjDIjgWYrRe675CVZCk6jRkXkORezMAEz"
}

resource "aws_instance" "example" {
  ami = "ami-40d28157"
  instance_type = "t2.micro"
  user_data = <<-EOF
        #!/bin/bash
        echo "Hello, World" > index.html
        nohup busybox httpd -f -p 8080 &
        EOF
  tags {
  Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
    ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
}
