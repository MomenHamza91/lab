data "vra_project" "this" {
  id = "${vra_project.Project-2.id}"
}
resource "vra_blueprint" "terraformbptest" {
  name        = var.blueprint_name
  description = "Created by vRA terraform provider"

  project_id = vra_project.terraformbptest.id

  content = <<-EOT
    formatVersion: 1
    inputs:
      image:
        type: string
        description: "Image"
      flavor:
        type: string
        description: "Flavor"
    resources:
      Machine:
        type: Cloud.Machine
        properties:
          image: $${input.image}
          flavor: $${input.flavor}
		  constraints:
           - tag: env:prod
  EOT
}
