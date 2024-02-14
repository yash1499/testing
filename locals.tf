locals {
  project_id   = data.null_data_source.project_id.outputs["value"]
  project_name = "mynewproject"
}

locals {
	  members_to_roles = {
	    for p in setproduct(
	      toset(var.user_sandbox_viewer),
	      toset(var.Role)
	    ) :
	    "${p[0]}-${p[1]}" => {
	      member = p[0]
	      role   = p[1]
	    }
	  }
	}
