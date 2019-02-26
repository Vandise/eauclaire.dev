# Eau Claire Development

A website for software / general development in the Eau Claire, WI area.

## What is this?

EC2 server configurations using ansible and terraform and a script to update the DNS records on Godaddy. Static website containing
either my consultation services, or maybe some random rants.

It's fairly generic for setting up a webserver on AWS, security group(s), and route 53.

No need for load balancing since this is a static, single page, website. Adding a load balancer takes a little more effort, different returns
from modules, and having your domain's nameservers pointing to Route 53.

## Setup:

You will need to add your aws credentials to a file called: `terraform/shared/config/credentials`. See `credentials_local` for the settings.

You will need to configure your webserver to have your SSH keys. See `terraform/shared/scripts/authorized_keys_local.sh`. Update this file and rename to `authorized_keys.sh`.

Some variables in `terraform/main.tf`:

```
variable "godaddy_key" {
  default = ""
  description = "Godaddy API Key"
}

variable "godaddy_secret" {
  default = ""
  description = "Godaddy API Secret"
}

variable "webserver_domain" {
  default = "eauclaire.dev"
  description = "Webserver Domain"
}
```

Ansible is specific when it comes to the requirements for eauclaire.dev ( SSL, server name, directories ). Configure it to your needs. Update `ansible/inventories/{env}/hosts` to point to your webservers ip after running terraform.

## Common Commands

Create the servers / dns records

```
$ > terraform apply
```

Kill everything

```
$ > terraform destroy
```

Configure webservers

```
ansible-playbook -u some-user eauclaire.dev.yml
```
