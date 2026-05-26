output "namespace_name" {
  description = "Created namespace name"
  value       = kubernetes_namespace.skybyte.metadata[0].name
}

output "secret_name" {
  description = "Created secret name"
  value       = kubernetes_secret.skybyte.metadata[0].name
}
