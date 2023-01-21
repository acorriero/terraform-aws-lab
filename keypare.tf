resource "aws_key_pair" "bastion_key" {
  key_name   = var.bastion_key_name
  public_key = file(var.bastion_public_key)
}