terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Creación del clúster básico de GKE
resource "google_container_cluster" "primary" {
  name     = "cloud-native-cluster"
  location = var.region

  # Se elimina el node pool por defecto inmediatamente después de la creación
  remove_default_node_pool = true
  initial_node_count       = 1

  # Configuración recomendada para red
  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {}
}

# Creación del node pool adicional
resource "google_container_node_pool" "primary_nodes" {
  name       = "custom-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 2

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
