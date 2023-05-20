resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = var.private_key      # Create "public key" to youe vm on AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create "privateKey.pem" to your Master Node!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ~/.ssh/privatekey.pem"
  }
}
