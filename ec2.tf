resource "aws_instance" "jenkins-server" {
  ami = "ami-0a699202e5027c10d"
  instance_type = "t2.micro"
  key_name = "jenkins-key"
  subnet_id = aws_subnet.public_subnet1.id 
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  user_data = file("jenkins.sh")
  tags = {
    Name = "Jenkins-server"
  }
}