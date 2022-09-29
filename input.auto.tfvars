region = "us-east-1"
name="security group"
description="testing purpose"
revoke_rules_on_delete=false
ingress_rules=["http-8080-tcp","http-80-tcp"]
egress_rules=["http-80-tcp","https-443-tcp"]
rules={
    http-8080-tcp=[8080, 8080, "tcp", "HTTP"]
    http-80-tcp   = [80, 80, "tcp", "HTTP"]
    https-443-tcp  = [443, 443, "tcp", "HTTPS"]
}