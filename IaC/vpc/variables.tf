variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "tags" {
  type = map(string)
  default = {
    Project     = "Study-k8s"
    Terraform   = "true"
    Environment = "Dev"
  }
}

variable "total_subnets" {
  description = "Number of subnets"
  default = 3
}