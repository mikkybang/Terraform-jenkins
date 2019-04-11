provider "aws" {
  region = "us-east-2"
  access_key = "AKIAIDI4WFKBOFGXB7LA"
  secret_key = "Xmg95aox/l4bVs+r5a+DJDjfT8PgvcWs4kfh5cUQ"
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
