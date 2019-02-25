resource "null_resource" "godaddy" {
  provisioner "local-exec" {
    command = "terraform output -module=hosted_zone eauclaire-dev-nameservers | bash networking/dns/update_dns.sh ${var.godaddy_key} ${var.godaddy_secret}"
  }
}