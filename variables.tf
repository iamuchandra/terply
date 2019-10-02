variable "region" {
	default = "us-west-1"
}

variable "amis" {
	type = map
	default = {
       "us-west-1" = "ami-0dbf5ea29a7fc7e05"	
       "us-west-2" = "ami-0994c095691a46fb5"
	}
}
