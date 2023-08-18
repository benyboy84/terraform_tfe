# The following code block is used to create workspace resources in project.

module "workspaces" {
  source = "./modules/workspaces"

  for_each = local.workspaces

  name         = each.key
  organization = data.tfe_organization.conseilsti.name
  project_id   = tfe_project.project["${each.value.project}"].id

  description                   = try(each.value.description, null)
  agent_pool_id                 = try(each.value.agent_pool_id, null)
  allow_destroy_plan            = try(each.value.allow_destroy_plan, null)
  auto_apply                    = try(each.value.auto_apply, null)
  execution_mode                = try(each.value.execution_mode, null)
  assessments_enabled           = try(each.value.assessments_enabled, null)
  file_triggers_enabled         = try(each.value.file_triggers_enabled, null)
  global_remote_state           = try(each.value.global_remote_state, null)
  remote_state_consumer_ids     = try(each.value.remote_state_consumer_ids, null)
  queue_all_runs                = try(each.value.queue_all_runs, null)
  source_name                   = try(each.value.source_name, null)
  source_url                    = try(each.value.source_url, null)
  speculative_enabled           = try(each.value.speculative_enabled, null)
  structured_run_output_enabled = try(each.value.structured_run_output_enabled, null)
  ssh_key_id                    = try(each.value.ssh_key_id, null)
  tag_names                     = try(each.value.tag_names, null)
  terraform_version             = try(each.value.terraform_version, null)
  trigger_prefixes              = try(each.value.trigger_prefixes, null)
  trigger_patterns              = try(each.value.trigger_patterns, null)
  working_directory             = try(each.value.working_directory, null)

}