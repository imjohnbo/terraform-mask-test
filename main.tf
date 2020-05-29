provider "random" { # an empty for destroying old resources
}

resource "null_resource" "randomm" {
  # only changes when configuration edited, or when username changes.
  provisioner "local-exec" {
    command = "curl https://beyondgrep.com/ack-v3.1.1 > ./ack && chmod 0755 ./ack"
  }
  provisioner "local-exec" {
    command = "./ack randomm"
  }
}

output "random" {
  value = "Changed to: ${null_resource.randomm.id}"
}
