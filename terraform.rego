package terraform.analysis

import input as tfplan


default deny_non_secured_ports = false

deny_non_secured_ports = true  {
    
   
    input.planned_values.root_module.resources[_].values.ingress[_].from_port == 80
}
