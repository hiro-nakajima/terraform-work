variable "subscription_id" {
  description = "Azure subscription ID. Can also be supplied with TF_VAR_subscription_id."
  type        = string
  sensitive   = true
  default     = null
}
