variable "namespace" {
  description = "Kubernetes namespace for skybyte app"
  type        = string
  default     = "skybyte-ns"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
