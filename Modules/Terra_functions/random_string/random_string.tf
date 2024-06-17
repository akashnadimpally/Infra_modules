resource "random_string" "string" {
  length  = 6
  lower   = true
  upper   = false
  numeric = true
  special = false // !@#$%&*()-_=+[]{}<>:?
  #   override_special = "/@£$"
  min_lower   = 2
  min_numeric = 2
  # min_upper = 2
  #   min_special = 3
}
