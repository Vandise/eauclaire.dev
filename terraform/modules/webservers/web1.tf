resource "aws_instance" "eauclaire_dev_web1" {
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.web_security_group.id}" ]
  associate_public_ip_address = true
  user_data = "${file("./shared/scripts/authorized_keys.sh")}"

  tags {
    Name = "eauclaire_dev_web1"
  }
  
  ami = "ami-c55673a0"
  availability_zone = "${var.aws_availability_zone}"
  subnet_id = "subnet-1e8c9e54"
}

output "web1_ip" {
  value = "${aws_instance.eauclaire_dev_web1.public_ip}"
}

output "web1_id" {
  value = "${aws_instance.eauclaire_dev_web1.id}"
}