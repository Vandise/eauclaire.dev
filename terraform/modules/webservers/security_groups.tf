resource "aws_security_group" "eauclaire_dev_web_security_group" {
  name = "eauclaire.dev-sg"
  description = "Eau Claire Development Web Security Group."
  vpc_id = "vpc-4f23f826"
}

resource "aws_security_group_rule" "ssh_ingress_access" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ] 
  security_group_id = "${aws_security_group.eauclaire_dev_web_security_group.id}"
}

resource "aws_security_group_rule" "egress_access" {
  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = "${aws_security_group.eauclaire_dev_web_security_group.id}"
}

resource "aws_security_group_rule" "insecure_public_traffic_ingress_access" {
  type = "ingress"
  from_port = "80"
  to_port = "80"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.eauclaire_dev_web_security_group.id}"
}

resource "aws_security_group_rule" "public_traffic_ingress_access" {
  type = "ingress"
  from_port = "${var.webserver_port}"
  to_port = "${var.webserver_port}"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.eauclaire_dev_web_security_group.id}"
}