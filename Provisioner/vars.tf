variable "AK" {}

variable "SK" {}

variable "region" {
  default = "ap-south-1"
}

variable "AMIS" {
  type = map
  default = {
      ap-south-1 = "ami-0470e33cd681b2476"
  }
}

variable "pub_key" {
  default = "firstkey.pub"
}

variable "pri_key" {
  default ="firstkey"
}


