variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-b73b63a0"
    us-west-1 = "ami-23e8a343"
    eu-west-1 = "ami-9398d3e0"
  }
}
