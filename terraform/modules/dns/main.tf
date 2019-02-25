resource "aws_route53_zone" "web1" {
  name = "${var.webserver_domain} "
  comment = "${var.webserver_domain} Zone"
}

resource "aws_route53_record" "web1" {
  zone_id = "${aws_route53_zone.web1.zone_id}"
  name = "${aws_route53_zone.web1.name}"
  type = "NS"
  ttl = "60"
  records = [ "${var.web1_ip}" ]
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.web1.zone_id}"
  name = "www.${aws_route53_zone.web1.name}"
  type = "NS"
  ttl = "60"
  records = [ "${var.web1_ip}" ]
}

output "nameservers" {  
  value = "${aws_route53_zone.web1.name_servers}"
}