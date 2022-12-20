
#resource "aws_volume_attachment" "ebs_attach_axul" {
#  device_name = "/dev/sdh"
#  volume_id   = aws_ebs_volume.ebs_volume_axul.id
#  instance_id = aws_instance.ec2_axul.id
#}

resource "aws_instance" "ec2_axul" {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.route_allow_http_ssh.id}"]
    subnet_id = "${var.subnet1}"
    key_name = "${aws_key_pair.key-class-1.id}"

    #depends_on = ["aws_internet_gateway.gw"]
    root_block_device {
        volume_size = 30
    }
    user_data = "${file("userdata.sh")}"
    tags = {
        Name = "Axul API"
        Owner = "Nahuel"
        Env = "dev"
    }
}

#resource "aws_ebs_volume" "ebs_volume_axul" {
#  availability_zone = "us-east-1d"
#  size              = 8
#}
