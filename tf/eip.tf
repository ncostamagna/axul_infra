#resource "aws_eip" "one" {
#    vpc = true
#    tags = {
#        Name = "Elastic IP Axul"
#    }
#}

resource "aws_eip_association" "eip_server1" {
    instance_id = "${aws_instance.ec2_axul.id}"
    allocation_id = "${var.ec2_eip}"
}
