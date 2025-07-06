variable "root_volume_type"{
    type = string
    default = "gp2"
}

variable "ec2_config" {
    type = object({
      v_size = number
      v_type = string
    })
  default = {
    v_size = 20
    v_type = "gp2"
  }
}

variable "additional_tags" {
    type = map(string) #expected to be a map of key-value pairs
    description = "Additional tags to be applied to the resources"
    default = {}
    
}