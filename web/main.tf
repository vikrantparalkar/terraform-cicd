#Creating EC2 Resource
#AMI ID depends on the account type and region specified


 resource "aws_instance" "server" {
   ami = "ami-0360c520857e3138f"
   instance_type = "t2.micro"
   subnet_id = var.sn
   security_groups = [var.sg]

   tags = {
     Name = "myserver"
   }

 }