variable "test" {
  default = "my_name is md raghib nadim"
}

variable "map" {
    type = map(string)
    default = {
        mykey = "my value"
    }
  
}
