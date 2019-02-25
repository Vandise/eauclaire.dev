variable "aws_region" {
  default = "us-east-2"
  description = "AWS Region"
}

variable "aws_availability_zone" {
  default = "us-east-2c"
  description = "AWS availability zone"
}

variable "godaddy_key" {
  default = ""
  description = "Godaddy API Key"
}

variable "godaddy_secret" {
  default = ""
  description = "Godaddy API Secret"
}

variable "web1_ip" {
  default = ""
  description = "Web 1 server ip"
}

provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_file = "./shared/config/credentials"
}

module "webservers" {
  source = "./modules/webservers"

  aws_region = "${var.aws_region}"
  aws_availability_zone = "${var.aws_availability_zone}"
  webserver_port = "443"
}

module "dns" {
  source = "./modules/dns"

  web1_ip = "${module.webservers.web1_ip}"
}

module "godaddy" {
  source = "./modules/godaddy"

  godaddy_key = "${var.godaddy_key}"
  godaddy_secret = "${var.godaddy_secret}"
  web1_ip = "${module.webservers.web1_ip}"
}