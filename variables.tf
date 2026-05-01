variable "vpc_config" {
  description = "to get the cidr name of vpc from user"
  type = object({
    cidr_block = string
    name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR Format - ${ar.vpc_config_block}"
  }
}

variable "subnet_config" {
  description = "get the CIDr and az"
  type = map({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  })
  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR Format - ${var.subnet_config[each.key].cidr_block}"
  }
}
