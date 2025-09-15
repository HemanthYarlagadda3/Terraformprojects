output "privateip" {
   value = aws_instance.hemanth.public_ip
}

output "availabilityzone" {
   value = aws_instance.hemanth.availability_zone
}

