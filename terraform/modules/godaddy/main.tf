resource "null_resource" "godaddy" {
  provisioner "local-exec" {
    command = "bash modules/godaddy/update_dns.sh ${var.godaddy_key} ${var.godaddy_secret} ${web1_ip}"
  }
}