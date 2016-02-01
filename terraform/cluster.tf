variable "atlas_token" {}
variable "digitalocean_token" {}
variable "ssh_key_id" {}
variable "ssh_port" {}
variable "etcd_discovery_id" {}

atlas {
    name = "tomohiro/cluster-test"
}

provider "atlas" {
    token = "${var.atlas_token}"
}

provider "digitalocean" {
    token = "${var.digitalocean_token}"
}

resource "template_file" "user_data" {
    template = "${file("user-data.yml.tpl")}"

    vars {
        ssh_port          = "${var.ssh_port}"
        etcd_discovery_id = "${var.etcd_discovery_id}"
    }
}

resource "digitalocean_droplet" "test" {
    image              = "coreos-stable"
    name               = "test"
    region             = "sgp1"
    size               = "1gb"
    ipv6               = false
    private_networking = true
    ssh_keys           = ["${var.ssh_key_id}"]
    user_data          = "${template_file.user_data.rendered}"
}
