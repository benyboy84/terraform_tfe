resource "tfe_workspace" "this" {

  name                          = var.name
  organization                  = var.organization
  description                   = var.description
  agent_pool_id                 = var.agent_pool_id
  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  execution_mode                = var.execution_mode
  assessments_enabled           = var.assessments_enabled
  file_triggers_enabled         = var.file_triggers_enabled
  global_remote_state           = var.global_remote_state
  remote_state_consumer_ids     = var.remote_state_consumer_ids
  project_id                    = var.project_id
  queue_all_runs                = var.queue_all_runs
  source_name                   = var.source_name
  source_url                    = var.source_url
  speculative_enabled           = var.speculative_enabled
  structured_run_output_enabled = var.structured_run_output_enabled
  ssh_key_id                    = var.ssh_key_id
  tag_names                     = var.tag_names
  terraform_version             = var.terraform_version
  trigger_prefixes              = var.trigger_prefixes
  trigger_patterns              = var.trigger_patterns
  working_directory             = var.working_directory

  lifecycle {
    ignore_changes = [source_url]

    precondition {
      condition     = var.agent_pool_id != null ? var.execution_mode == "agent" : true
      error_message = "`agent_pool_id` requires `execution_mode` to be set to `agent`."
    }

    precondition {
      condition     = var.source_url != null ? var.source_name != null : true
      error_message = "`source_url` requires `source_name` to also be set."
    }
  }
}
