provider "aws"{
      region     = var.region
}

resource "aws_security_group" "this" {
  name                   = var.name
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )

  timeouts {
    create = var.create_timeout
    delete = var.delete_timeout
  }
}

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.ingress_rules)

  security_group_id = aws_security_group.this.id
  type              = "ingress"

  cidr_blocks      = var.ingress_cidr_blocks
  ipv6_cidr_blocks = var.ingress_ipv6_cidr_blocks
  prefix_list_ids  = var.ingress_prefix_list_ids
  description      = var.rules[var.ingress_rules[count.index]][3]

  from_port = var.rules[var.ingress_rules[count.index]][0]
  to_port   = var.rules[var.ingress_rules[count.index]][1]
  protocol  = var.rules[var.ingress_rules[count.index]][2]
}

resource "aws_security_group_rule" "egress_rules" {
  count = length(var.egress_rules)

  security_group_id = aws_security_group.this.id
  type              = "egress"

  cidr_blocks      = var.egress_cidr_blocks
  ipv6_cidr_blocks = var.egress_ipv6_cidr_blocks
  prefix_list_ids  = var.egress_prefix_list_ids
  description      = var.rules[var.egress_rules[count.index]][3]

  from_port = var.rules[var.egress_rules[count.index]][0]
  to_port   = var.rules[var.egress_rules[count.index]][1]
  protocol  = var.rules[var.egress_rules[count.index]][2]
}
