# target group
resource "aws_lb_target_group" "tg" {
  name     = var.tg_name
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id
}

# to attach ec2 to target gp
resource "aws_lb_target_group_attachment" "tg_attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.private_vm.id
  port             = var.lb_port
}

# Craete load balancer
resource "aws_lb" "lb" {
  name               = var.lb_name
  internal           = var.lb_internal_value
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.lb_subnets
}

# Create listener: This will determine on which port and protocol that load balancer will listen
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.lb_port
  protocol          = var.lb_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}