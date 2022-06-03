resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./keys/aws-key.pub") #Chave gerada localmente e é inserida no AWS KEY PAIRS
}

resource "aws_instance" "vm" {
  ami                         = "ami-0eea504f45ef7a8f7" #ubuntu-20.04.us-east-2
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.network_vpc.subnet_id
  vpc_security_group_ids      = [module.network_vpc.security_group_id]
  associate_public_ip_address = true  

  tags = {
    "Name" = "vm-terraform"
  }
}