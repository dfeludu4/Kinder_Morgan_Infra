resource "aws_instance" "web" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  monitoring = true
  

  root_block_device {
  encrypted     = true
  }

  tags = {
    Name = "Kinder_Morgan_Infra_Server"
  }
}