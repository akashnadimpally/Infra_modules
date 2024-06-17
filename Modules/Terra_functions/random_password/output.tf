output "random_password_output_bcrypt_hash" {
  value = random_password.password.bcrypt_hash
}

output "random_password_output_result" {
  value     = random_password.password.result
  sensitive = true
}