variable "listener_priority" {
  description = "Priority for the ALB listener rule"
  type        = number
  default     = 100
}

variable "domain_name" {
  default = "rails.sandbox.rizap.jp"
}

variable "subdomain" {
  default = "test123"
}

variable "service_name" {
  default = "rails-application-sandbox-test123"
}
