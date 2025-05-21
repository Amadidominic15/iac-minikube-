
resource "minikube_cluster" "minikube" {
  driver       = "docker"
  cluster_name = "devops-project1"
  addons = [
    "default-storageclass",
    "storage-provisioner"
  ]
}