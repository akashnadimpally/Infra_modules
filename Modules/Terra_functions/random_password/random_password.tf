resource "random_password" "password" {
  length  = 32
  lower   = true
  upper   = true
  numeric = true
  special = true // !@#$%&*()-_=+[]{}<>:?
  #   override_special = "/@£$"
  min_lower   = 8
  min_numeric = 8
  min_upper   = 8
  min_special = 8
}

