variable "GOOGLE_PROJECT" {
  type        = string
  description = "GCP project"
}

variable "GOOGLE_REGION" {
  type        = string
  description = "GCP region name"
}

variable "GKE_MACHINE_TYPE" {
  type        = string
  default     = "g1-small"
  description = "Machine type"
}

variable "GKE_NUM_NODES" {
  type        = number
  description = "GKE node number"
}

variable "GKE_CLUSTER_NAME" {
  type        = string
  default     = "doki-demo"
  description = "GKE cluster name"
}

variable "GKE_POOL_NAME" {
  type        = string
  default     = "doki-pool"
  description = "GKE pool name"
}

variable "GITHUB_OWNER" {
  type        = string
  description = "Github owner repository to use"
}

variable "GITHUB_TOKEN" {
  type        = string
  description = "Github personal access token"
}