variable "billing_account" {
  description = "The billing account ID to enable for this project."
  default     = "01F01C-EC0BAC-DD9482"
}

variable "folder_id" {
  description = "A folder to create this project under. If none is provided, the project will be created under the organization."
  default     = "324244242"
}

variable "project_name" {
  description = "Select a project name"
  default     = "mypro"
}

variable "Environment" {
  description = "Choose an environment"
  default     = "Prod"
}

variable "Role" {
  description = "Choose a role"
  type= list(string)
  default     = ["roles/viewer"]
}

variable "Role_viewer" {
  description = "Choose a role"
  default     = "roles/viewer"
}



variable "labels" {
  description = "A set of key/value label pairs to assign to the project."
  type        = map(string)

  default = {
    environment = "sandbox"
  }
}

variable "enable_apis" {
  description = "Which APIs to enable for this project."
  type        = list(string)
  default     = ["cloudbilling.googleapis.com"]
}

# variable "user_policy_pairs" {
#     type = map(object({
#     member = string
#     role = string
#     }))
# }

variable "user_sandbox_viewer" {
  description = "user_sandbox_viewer"
  type        = list(string)
  default     = ["compute.googleapis.com", "cloudbilling.googleapis.com"]
}

variable "user_sandbox_editor" {
  description = "user_sandbox_editor"
  type        = list(string)
  default     = ["compute.googleapis.com", "cloudbilling.googleapis.com"]
}

variable "user_nonprod_viewer" {
  description = "user_nonprod_viewer"
  type        = list(string)
  default     = ["compute.googleapis.com", "cloudbilling.googleapis.com"]
}

variable "user_prod_viewer" {
  description = "user_prod_viewer"
  type        = list(string)
  default     = ["compute.googleapis.com", "cloudbilling.googleapis.com"]
}

variable "region" {
  description = "The preferred region to use for resources that require a region to be defined."
  default     = "us-central1"
}

variable "random_prefix" {
  description = "Whether or not to generate a random prefix for your project ID. If you want to use a `custom_id` and don't want a prefix, set this to `'false'` and don't set a value for `id_prefix`."
  default     = "true"
}

variable "id_prefix" {
  description = "A prefix to use with your `custom_id` or `random_id`."
  default     = ""
}

variable "custom_id" {
  description = "Custom project ID if not using `random_id`. Either `custom_id` must be specified or `random_id` must be true."
  default     = ""
}

variable "display_name" {
  description = "The name that will be displayed in GCP Cloud Console's interface."
  default     = ""
}
