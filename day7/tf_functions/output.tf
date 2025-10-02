#actual values
output "actual_content" {
  value = local.value
}

#convert to upper case
output "upper_case" {
  value = upper(local.value)
}

#convert to lower case
output "lower_case" {
  value = lower(local.value)
}

#check if the string starts with Men
output "starts_with" {
  value = startswith(local.value, "Men")
}

#split content
output "split_content" {
  value = split(" ", local.value)
}

#min element of the list
output "min_element" {
  value = local.min_value
}

#max element of the list
output "max_element" {
  value = local.max_value
}

#abs function
output "absolute_value" {
  value = abs(-45)
}