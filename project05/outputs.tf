
output "North_Private_IP"{
value = aws_instance.hemanthnorth.public_ip
}

output "East_Private_IP"{
value = aws_instance.hemantheast.public_ip
}

