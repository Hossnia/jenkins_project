resource "aws_security_group" "jenkins-sg" {
  description = "This is the security group of my jenkins server"  
  name = "jenkins-sg"
  vpc_id = aws_vpc.jenkins-vpc.id

  ingress {
    description = "port 8080 for jenkins connection"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "port 22 for ssh connection"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}