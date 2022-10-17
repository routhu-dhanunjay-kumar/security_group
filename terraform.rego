package terraform.analysis

import input as tfplan


default deny_non_secured_ports = false

deny_non_secured_ports = true  {
    
    input.resources[_].type == "aws_security_group"
   
    input.resources[_].instances[_].attributes.ingress[_].from_port == 80
}
