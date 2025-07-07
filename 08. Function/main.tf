terraform {}

locals {
  value = "Hello World"
}

variable "string_list" {
    type = list(string)
    default = ["vaibhav", "Pushpak", "Om"]
}

output "output" {
    value = lower(local.value)
  
}