variable "vpc_id" {
  description = "VPC ID"
  default     = "vpc-0cb2a31368e6eb682"
}

variable "subnet_id" {
  description = "Subnet ID"
  default     = "subnet-03f534bf57fad61b1" 
}

variable "vpc_security_group_ids" {
  description = "VPC Security Group ID"
  default     = "sg-05a2c334ee41f2f86"  
}

variable "tags" {
  description = "Tags for the EC2 instance"
  default     = {}
}