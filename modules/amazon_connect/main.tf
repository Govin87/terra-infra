resource "aws_connect_instance" "connect" {
  identity_management_type = "CONNECT_MANAGED" # Or "EXISTING_DIRECTORY" if using directory integration
  inbound_calls_enabled    = true
  outbound_calls_enabled   = true
  instance_alias           = "your-instance-alias"
}

