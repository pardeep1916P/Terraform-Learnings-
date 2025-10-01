#calculation
locals {
  multiply        = var.num_list[2] * 20
  #print doubled numbers
  doubled_numbers = [for num in var.num_list : num * 2]
}

