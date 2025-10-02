locals {
  value = "Men are brave 💀"
}


locals {
  min_value = min([for num in var.nums_list : num]...)
}

locals {
  max_value = max([for num in var.nums_list : num]...)
}
