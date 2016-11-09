data "aws_ip_ranges" "european_ec2" {
  regions = [ "eu-west-1", "eu-central-1" ]
  services = [ "ec2" ]
}

data "aws_ip_ranges" "us_ec2" {
  regions = [ "us-west-1", "us-east-1", "us-east-2", "us-west-2" ]
  services = [ "ec2" ]
}

resource "aws_security_group" "from_europe" {
 name = "from_europe"

  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = [ "${data.aws_ip_ranges.european_ec2.cidr_blocks}" ]
  }
  ingress {
    from_port = "any"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["${data.aws_ip_ranges.european_ec2.cidr_blocks}"]
  }
  ingress {
    from_port = "any"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["${data.aws_ip_ranges.european_ec2.cidr_blocks}"]
  }
  ingress {
    from_port = "any"
    to_port = "any"
    protocol = "icmp"
    cidr_blocks = ["${data.aws_ip_ranges.european_ec2.cidr_blocks}"]
    cidr_blocks = ["${data.aws_ip_ranges.us_ec2.cidr_blocks}"]
  }

  tags {
    CreateDate = "${data.aws_ip_ranges.european_ec2.create_date}"
    SyncToken = "${data.aws_ip_ranges.european_ec2.sync_token}"
  }

}
