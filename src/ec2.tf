resource "aws_instance" "demo-instance" {
  ami                         = "ami-id"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "${aws_subnet.demoinstance.id}"
  associate_public_ip_address = true
tags = {
    Name = "My Public Instance"
  }
}