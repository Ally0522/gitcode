resource "aws_security_group" "mysg" {
    name = "dynamicSG"
    description = "SG for Server"

    dynamic "ingress" {
      for_each = var.sg_port 
      iterator = port
      content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
      }
    }

dynamic "egress" {
    for_each = var.sg_port
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]

    }
  
}

  
}