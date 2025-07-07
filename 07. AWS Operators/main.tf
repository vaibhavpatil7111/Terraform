terraform {}

# Number List

variable "number_list" {
    type = list(number)
    default = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
}

# Object List Of Person
variable "person_list" {
    type = list(object({
        fname = string
        lname = string
        age  = number
    }))
    default = [ {
      fname = "Vabby"
      lname = "Patil"
      age = 25
    } ]
    description = "List of person objects with first name, last name, and age."
  
}

# Map of Person
variable "map_list" {
    type = map(number)
    default = {
      "one" = 1
      "two" = 2
      "three" = 3
    }
  
}

# Calculate the sum of number_list

locals {
  mul = 2 * 2
  add = 2 + 2
  sub = 2 - 2
    div = 2 / 2
}

output "output" {
    value = local.add
    
  
}