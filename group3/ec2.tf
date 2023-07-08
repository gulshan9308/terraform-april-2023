data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
 
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  } 
    
  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair
  public_key = file("~/.ssh/id_rsa.pub")
}
  

resource "aws_instance" "group3" {
  depends_on = [aws_key_pair.deployer]
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.public1.id
  user_data                   = file("apache.sh")

}
 
resource "aws_instance" "group3" {
  depends_on = [aws_instance.group3]
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.private1.id
  user_data                   = file("apache.sh")
}