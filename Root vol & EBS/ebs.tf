resource "aws_ebs_volume" "ebs_1" {
    availability_zone = aws_instance.root_vol.availability_zone
    # note >>> the ebs volume should be created in same az as your instance in order to attach it to the instance 
    size = 12
    type = "gp3"
    encrypted = true
    
    tags = {
        Name = "extra-ebs"
    }
}


# Now we will attach the above EBS volume to our ec2 instance which have created using the root_vol.tf 

resource "aws_volume_attachment" "ebs_vol"{
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.ebs_1.id
    instance_id = aws_instance.root_vol.id
}