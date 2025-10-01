#numbers list
variable "num_list" {
  type    = list(number)
  default = [1, 2, 3, 4, 5]
}

#heroes list
variable "hero_list" {
  type    = list(string)
  default = ["Superman", "Batman", "Spiderman", "Shang-Chi"]
}

#details   
variable "details" {
  type = list(object({
    first_name = string
    last_name  = string
  }))
  default = [{ first_name = "ahad", last_name = "abdul" },
    { first_name = "ahamad", last_name = "abdul" },
    { first_name = "aravind", last_name = "gulla" },
  { first_name = "harsha", last_name = "goli" }]
}


#create a map variable
variable "map_list" {
  type = map(number)
  default = {
    "one"   = 1
    "two"   = 2
    "three" = 3
    "four"  = 4
    "five"  = 5
  }
}
