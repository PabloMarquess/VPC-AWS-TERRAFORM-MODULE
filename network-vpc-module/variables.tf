variable "cidr_vpc" {
  description = "cidr_block para VPC"
  type        = string
}

variable "cidr_subnet" {
  description = "cidr_block para SUBNET"
  type        = string
}
# Environment = Ambiente
variable "environment" {
  description = "Ambiente onde o recurso vai ser utilizado"
  type        = string
}