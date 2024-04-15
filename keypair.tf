resource "tls_private_key" "jenkins-key" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "aws_key_pair" "jenkins-key" {
  key_name = "jenkins-key"
  public_key = tls_private_key.jenkins-key.public_key_openssh
}

resource "local_file" "jenkins-key" {
  filename = "jenkins-key.pem"
  content = tls_private_key.jenkins-key.private_key_pem
}