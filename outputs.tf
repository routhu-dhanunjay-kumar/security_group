output "security_group_arn" {
  description = "The ARN of the security group"
  value       = try(aws_security_group.this.arn, "")
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = try(aws_security_group.this.id, "")
}

output "security_group_owner_id" {
  description = "The owner ID"
  value       = try(aws_security_group.this.owner_id, "")
}

output "key_tags" {
  description = "The globally unique identifier for the key"
  value       = try(aws_security_group.this.tags_all, null)
}
