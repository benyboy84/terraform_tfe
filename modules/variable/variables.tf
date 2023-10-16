variable "key" {
  description = "(Required) Name of the variable."
  type        = string
}

variable "value" {
  description = "(Required) Value of the variable."
  type        = string
}

variable "category" {
  description = "(Required) Whether this is a Terraform or environment variable. Valid values are `terraform` or `env`."
  type        = string

  validation {
    condition     = contains(["terraform", "env", "agent"], var.category) ? true : false
    error_message = "Valid values are `terraform` or `env`."
  }
}

variable "variable_description" {
  description = "(Optional) Description of the variable."
  type        = string
  default     = null
}

variable "hcl" {
  description = "(Optional) Whether to evaluate the value of the variable as a string of HCL code. Has no effect for environment variables."
  type        = bool
  default     = false
}

variable "sensitive" {
  description = "(Optional) Whether the value is sensitive. If true then the variable is written once and not visible thereafter."
  type        = bool
  default     = false
}

#One of the following (Required)
variable "workspace_id" {
  description = "(Optional) ID of the workspace that owns the variable."
  type        = string
  default     = null
}

variable "variable_set_id" {
  description = "(Optional) ID of the variable set that owns the variable."
  type        = string
  default     = null
}

variable "variable_set_name" {
  description = "(Optional) Name of the variable set."
  type        = string
  default     = null
}

variable "variable_set_description" {
  description = "(Optional) Description of the variable set."
  type        = string
  default     = null
}

variable "global" {
  description = "(Optional) Whether or not the variable set applies to all workspaces in the organization."
  type        = bool
  default     = false
}

variable "organization" {
  description = "(Optional) Name of the organization. If omitted, organization must be defined in the provider config."
  type        = string
  default     = null
}

variable "variable_set_id" {
  description = "(Optional) The variable set ID."
  type        = string
}

variable "workspace_name" {
  description = "(Optional) Workspace name to add the variable set to."
  type        = string
  default     = null
}

variable "workspace_id" {
  description = "(Optional) Workspace ID to add the variable set to."
  type        = string
}

variable "variable_set_id" {
  description = "(Optional) Name of the variable set to add."
  type        = string
}

variable "project_name" {
  description = "(Optional) Project name to add the variable set to."
  type        = string
  default     = null
}

variable "project_id" {
  description = "(Optional) Project ID to add the variable set to."
  type        = string
}