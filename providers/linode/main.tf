terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.2"
    }
  }
}

provider "linode" {
}

variable "ssh_pub_key" {
 type = string 
}

resource "linode_instance" "master-node" {
  region          = "us-east"
  type            = "g6-nanode-1"
  image           = "linode/ubuntu20.04"
  tags            = ["tmp", "k8s-tests", "master"]
  authorized_keys = [ var.ssh_pub_key ]
}

resource "linode_instance" "worker-node" {
  count = 2
  region          = "us-east"
  type            = "g6-nanode-1"
  image           = "linode/ubuntu20.04"
  tags            = ["tmp", "k8s-tests", "worker"]
  authorized_keys = [ var.ssh_pub_key ]
}

output "master-ips" {
  value = linode_instance.master-node.ip_address
}

output "worker-ips" {
  value = linode_instance.worker-node[*].ip_address
}
