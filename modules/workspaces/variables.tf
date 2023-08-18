variable "name" {
  description = "(Required) Name of the workspace."
  type        = string
}

variable "organization" {
  description = "(Required) Name of the organization."
  type        = string
}

variable "description" {
  description = "(Optional) A description for the workspace."
  type        = string
  default     = null
}

variable "agent_pool_id" {
  description = "(Optional) The ID of an agent pool to assign to the workspace. Requires execution_mode to be set to agent. This value must not be provided if execution_mode is set to any other value or if operations is provided."
  type        = string
  default     = null
}

variable "allow_destroy_plan" {
  description = "(Optional) Whether destroy plans can be queued on the workspace."
  type        = bool
  default     = true
}

variable "auto_apply" {
  description = "(Optional) Whether to automatically apply changes when a Terraform plan is successful."
  type        = bool
  default     = false
}

variable "execution_mode" {
  description = "(Optional) Which execution mode to use. Using Terraform Cloud, valid values are `remote`, `local` or `agent`. When set to `local`, the workspace will be used for state storage only."
  type        = string
  default     = "remote"

  validation {
    condition     = contains(["remote", "local", "agent"], var.execution_mode)
    error_message = "Valid values are `remote`, `local` or `agent`."
  }
}

variable "assessments_enabled" {
  description = "(Optional) Whether to regularly run health assessments such as drift detection on the workspace."
  type        = bool
  default     = false
}

variable "file_triggers_enabled" {
  description = "(Optional) Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run."
  type        = bool
  default     = true
}

variable "global_remote_state" {
  description = "(Optional) Whether the workspace allows all workspaces in the organization to access its state data during runs. If `false`, then only specifically approved workspaces can access its state (remote_state_consumer_ids)."
  type        = bool
  default     = false
}

variable "remote_state_consumer_ids" {
  description = "(Optional) The set of workspace IDs set as explicit remote state consumers for the given workspace."
  type        = set(string)
  default     = []
}

variable "project_id" {
  description = "(Optional) ID of the project where the workspace should be created."
  type        = string
  default     = null
}

variable "queue_all_runs" {
  description = "(Optional) Whether the workspace should start automatically performing runs immediately after its creation. When set to `false`, runs triggered by a webhook (such as a commit in VCS) will not be queued until at least one run has been manually queued. Note: This default differs from the Terraform Cloud API default, which is `false`. The provider uses `true` as any workspace provisioned with `false` would need to then have a run manually queued out-of-band before accepting webhooks."
  type        = bool
  default     = true
}

variable "source_name" {
  description = "(Optional) A friendly name for the application or client creating this workspace. If set, this will be displayed on the workspace as 'Created via '. Requires source_url to also be set."
  type        = string
  default     = null
}

variable "source_url" {
  description = "(Optional) A URL for the application or client creating this workspace. This can be the URL of a related resource in another app, or a link to documentation or other info about the client. Requires source_name to also be set. Note: The API does not (currently) allow this to be updated after a workspace has been created, so modifying this value will result in the workspace being replaced. To disable this, use an ignore changes lifecycle meta-argument"
  type        = string
  default     = null
}

variable "speculative_enabled" {
  description = "(Optional) Whether this workspace allows speculative plans. Setting this to `false` prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors."
  type        = bool
  default     = true
}

variable "structured_run_output_enabled" {
  description = "(Optional) Whether this workspace should show output from Terraform runs using the enhanced UI when available. Setting this to `false` ensures that all runs in this workspace will display their output as text logs."
  type        = bool
  default     = true
}

variable "ssh_key_id" {
  description = "(Optional) The ID of an SSH key to assign to the workspace."
  type        = string
  default     = null
}

variable "tag_names" {
  description = "(Optional) A list of tag names for this workspace. Note that tags must only contain lowercase letters, numbers, colons, or hyphens."
  type        = list(string)
  default     = []
}

variable "terraform_version" {
  description = "(Optional) The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like ~> 1.0.0); if you specify a constraint, the workspace will always use the newest release that meets that constraint."
  type        = string
  default     = null
}

variable "trigger_prefixes" {
  description = "(Optional) List of repository-root-relative paths which describe all locations to be tracked for changes."
  type        = list(string)
  default     = null
}

variable "trigger_patterns" {
  description = "(Optional) List of glob patterns that describe the files Terraform Cloud monitors for changes. Trigger patterns are always appended to the root directory of the repository. Mutually exclusive with trigger-prefixes."
  type        = list(string)
  default     = null
}

variable "working_directory" {
  description = "(Optional) A relative path that Terraform will execute within. Defaults to the root of your repository."
  type        = string
  default     = null
}
