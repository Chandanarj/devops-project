terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

resource "kubernetes_namespace" "skybyte" {
  metadata {
    name = var.namespace
    labels = {
      managed-by  = "terraform"
      environment = var.environment
    }
  }
}

resource "kubernetes_resource_quota" "skybyte" {
  metadata {
    name      = "skybyte-quota"
    namespace = kubernetes_namespace.skybyte.metadata[0].name
  }
  spec {
    hard = {
      "requests.cpu"    = "500m"
      "requests.memory" = "256Mi"
      "limits.cpu"      = "1000m"
      "limits.memory"   = "512Mi"
      pods              = "10"
    }
  }
}

resource "kubernetes_secret" "skybyte" {
  metadata {
    name      = "skybyte-secret"
    namespace = kubernetes_namespace.skybyte.metadata[0].name
  }
  data = {
    app-key = base64encode("my-secret-key-123")
  }
}
