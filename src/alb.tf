resource "aws_lb" "public-alb" {
  name               = "Public ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demosg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-1.id]
}
resource "aws_lb_target_group" "target-elb" {
  name     = "ALB TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_id.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.public-alb.arn
  target_id        = aws_instance.demo-instance.id
  port             = 80
depends_on = [
    aws_instance.demo-instance
  ]
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.public-alb.arn
  target_id        = aws_instance.demo-instance1.id
  port             = 80
depends_on = [
    aws_instance.demo-instance1,
  ]
}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.public-alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public-alb.arn
  }
}