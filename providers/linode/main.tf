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

resource "linode_instance" "minimal-vm" {
  region          = "us-east"
  type            = "g6-nanode-1"
  image           = "linode/ubuntu20.04"
  tags            = ["tmp", "testing"]
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLctZTXVVj+Ir6vqRA0Ozh9u6sbAQwka/vTeti+VLxoWpo1GBJFcuZQaa4IJMvlL0Nqt0AYLOuSjHvIZmowqRpLkBuAktnBlB7ie+uMFOIZ+YRUEQDf58P+CXayenXYXHZXRSAjN1ofMIkemqkA05W334JL78gNnQQimYyBZZj1CQL9YSrdhVmcccX/+qD/nbtsJqQLKgmjEuQZnibrubZEgIlrqwAHEftUJEK9CjOp20A2MOaPavgPIFGsLw9M+OhFN9sRD9cndQvF9qGcvG1Xe86aX3phE9jHRoL7qxAF2BFyYT5e8D3xhr5HxJCbQA5GcWm7UW3wHMTR1gVpQ2aohmMgrfqXl0AFXHB6LwSuTn6T0ijZYCMQropeLnxbQjVtj1VtiD0loPsk77JS7ijwCd1OjSzwRACtlkjrx/hedSPmMgYAl4yofOuL2GPGf9VBqXmNJcBThrLoAKwnWew6SBLcZ7Za1PaPEbW2UzzHQQFRpPMGx+D4BzsQNMHaq8= scottw@scotts-air.lan"]
}

output "vm-ip-address" {
  value = linode_instance.minimal-vm.ip_address
}
