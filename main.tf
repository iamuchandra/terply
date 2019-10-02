provider "aws" {
	profile = "default"
	region  = var.region
}


resource "aws_instance" "example" {
	ami = var.amis[var.region]
	instance_type = "t2.micro"
	depends_on = [aws_s3_bucket.umaexample]

	provisioner "local-exec" {
		command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
	}
}

resource "aws_eip" "ip" {
	vpc = true
	instance = aws_instance.example.id
}

resource "aws_s3_bucket" "umaexample" {
	bucket = "uma-terraform-getting-started-guide"
	acl = "private"
}

output "ami" {
	value = aws_instance.example.ami
}
