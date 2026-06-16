variable "aws_instace_type" {
    default = "t3.micro"
    type = string
      
}

variable "ec2_default_root_storage_size" {
    default = 25
    type = number
  
}

variable "ec2_ami_id" {
    default = "ami-0de864d6a3bd20ea8"
    type = string
  
}

variable "env" {
    default = "prd"
    type = string
  
}
