resource "linode_stackscript" "microk8s-install" {
  label       = "microk8s"
  description = "Installs microk8s as a master node"
  script      = <<EOF
#!/bin/bash
snap install microk8s --classic --channel=1.24
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
EOF
  images = ["linode/ubuntu20.04"]
  rev_note = "initial revision"
}
