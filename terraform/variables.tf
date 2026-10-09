variable "project_id" {
  description = "El ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "La región para desplegar el clúster (ej. us-central1)"
  type        = string
  default     = "us-central1"
}
