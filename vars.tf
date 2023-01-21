variable "region" {
  default = "us-east-1"
}

variable "bastion_ami" {
  type        = map(any)
  description = "AMI to use for Bastion host"
}

variable "bastion_key_name" {
  #
}
variable "bastion_private_key" {
  description = "Bastion private key"
}

variable "bastion_public_key" {
  description = "Bastion public key"
}

variable "bation_username" {
  description = "Bastion login username"
}

variable "bastion_ip" {
  description = "Bastion IP"
}

variable "rmquser" {
  description = "value"
}

variable "rmqpass" {
  description = "value"
}

variable "dbuser" {
  description = "value"
}

variable "dbpass" {
  description = "value"
}

variable "dbname" {
  description = "value"
}

variable "instance_count" {
  description = "value"
}

variable "vpc_name" {
  description = "value"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "zone2" {
  default = "us-east-1b"
}

variable "zone3" {
  default = "us-east-1c"
}

variable "vpc_cidr" {
  default = "172.21.0.0/16"
}

variable "pubsub1cidr" {
  default = "172.21.1.0/24"
}

variable "pubsub2cidr" {
  default = "172.21.2.0/24"
}

variable "pubsub3cidr" {
  default = "172.21.3.0/24"
}

variable "privsub1cidr" {
  default = "172.21.4.0/24"
}

variable "privsub2cidr" {
  default = "172.21.5.0/24"
}

variable "privsub3cidr" {
  default = "172.21.6.0/24"
}