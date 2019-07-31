# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template."

}

resource "null_resource" "sleep" {
  count=1000
  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "mktemp -d ${count.index}"
  }
}