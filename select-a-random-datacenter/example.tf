# Configure the Hetzner Cloud Provider
variable "hcloud_token" {}

provider "hcloud" {
  token = "${var.hcloud_token}"
}

data "hcloud_datacenters" "ds" {}

resource "random_shuffle" "dc" {
  input        = ["${data.hcloud_datacenters.ds.names}"]
  result_count = "3"
}
