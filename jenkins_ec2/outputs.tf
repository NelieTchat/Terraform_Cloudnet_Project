# In your main.tf file (assuming outputs are defined in jenkins_server)
output "instance_id" {
  value = module.jenkins_server.instance_id
}

# output "public_dns_name" {
#   value = module.jenkins_server.public_dns_name
# }

output "public_ip" {
  value = module.jenkins_server.public_ip
}
