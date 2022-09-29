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
   dynamic ingress {
    for_each = var.ingress
    content {
      description      = lookup(ingress.value, "description", null)
      from_port        = lookup(ingress.value, "from_port", null)
      to_port          = lookup(ingress.value, "to_port", null)
      protocol         = lookup(ingress.value, "protocol", null)
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
    }
  }

  dynamic egress {
    for_each = var.egress
    content {
      description      = lookup(egress.value, "description", null)
      from_port        = lookup(egress.value, "from_port", null)
      to_port          = lookup(egress.value, "to_port", null)
      protocol         = lookup(egress.value, "protocol", null)
      cidr_blocks      = lookup(egress.value, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
    }
  }
}
