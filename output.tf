output "PUBLIC_IP" {
  value = aws_instance.jenkins-server.public_ip
}

output "ssh" {
  value = "ssh -i jenkins-key.pem ec2-user@${aws_instance.jenkins-server.public_ip}"
}