# locals {
#   user_policy_pairs = flatten([
#       for user in var.user_sandbox_viewer: {
#         role = "policy"
#         member   = user
#       }
#   ])
# }

// Creating a project
resource "google_project" "project" {
  billing_account = var.billing_account
  folder_id       = var.folder_id
  labels          = var.labels
  name            = var.project_name
  project_id      = local.project_id
}

// Enable the requested APIs.
resource "google_project_service" "gcp_apis" {
  for_each = toset(var.enable_apis)
  project = google_project.project.id
  service = each.key
}

resource "google_project_iam_member" "sandbox_viewer_iam_binding" {
  for_each = local.members_to_roles
  # for_each = var.user_policy_pairs
  project   = local.project_id
  role      = each.value.role
  member  = each.value.member
}

# resource "google_project_iam_binding" "sandbox_editor_iam_binding" {
#   count = length(var.user_sandbox_editor) > 0 ? 1 : 0
#   project   = local.project_id
#   role      = var.Role
#   members   = var.user_sandbox_editor
# }

# resource "google_project_iam_binding" "non_prod_iam_binding" {
#   count = length(var.user_nonprod_viewer) > 0 ? 1 : 0
#   project   = local.project_id
#   role      = var.Role
#   members   = var.user_nonprod_viewer
# }

# resource "google_project_iam_binding" "prod_iam_binding" {
#   count = length(var.user_prod_viewer) > 0 ? 1 : 0
#   project   = local.project_id
#   role      = var.Role
#   members   = var.user_prod_viewer
# }
