resource "aws_route53_zone" "eauclaire_dev" {
  name = "eauclaire.dev"
  comment = "eauclaire.dev Zone"
}

resource "aws_route53_record" "eauclaire_dev" {
  zone_id = "${aws_route53_zone.eauclaire_dev.zone_id}"
  name = "${aws_route53_zone.eauclaire_dev.name}"
  type = "NS"
  ttl = "60"
  records = [ "${var.web1_ip}" ]
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.eauclaire_dev.zone_id}"
  name = "www.${aws_route53_zone.eauclaire_dev.name}"
  type = "NS"
  ttl = "60"
  records = [ "${var.web1_ip}" ]
}

output "nameservers" {  
  value = "${aws_route53_zone.eauclaire_dev.name_servers}"
}