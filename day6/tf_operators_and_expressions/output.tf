#print doubled numbers
output "doubled_numbers" {
  value      = local.doubled_numbers
}

#print numbers list
output "numbers" {
  value = var.num_list
}

# print heros list
output "heros" {
  value = var.hero_list
}

#print calculation
output "calculation" {
  value = local.multiply
}

#print multiplication
output "multiplication" {
  value = local.multiply
}
