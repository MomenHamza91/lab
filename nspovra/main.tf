
resource "vra_blueprint" "terraformbptest" {
  name        = var.blueprint_name
  description = "Created by vRA terraform provider"

  project_id = "2F09148963-41f5-4ace-9803-418bb4255973"
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
