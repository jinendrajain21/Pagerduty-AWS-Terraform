#####################EC2 with nginx server ######################

data "aws_ami" "test_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "PagerDuty-instance" {
  ami           = data.aws_ami.test_ami.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet-Pager.id

  vpc_security_group_ids = [aws_security_group.Pager-SG.id]

  key_name = aws_key_pair.mykeypair.key_name

  /*provisioner "remote-exec" {
    inline = [<<-EOF
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo yum install firewalld -y
    sudo systemctl start firewalld
    sudo systemctl enable firewalld
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --permanent --add-port=80/tcp
    sudo firewall-cmd --reload
    sudo touch /etc/httpd/conf.d/lb.conf
    sudo bash -c 'echo "<Proxy balancer://linuxhelp>
              BalancerMember http://"${aws_instance.PagerDuty-instance.private_ip}":80
              ProxySet lbmethod=byrequests
      </Proxy>
      <Location /balancer-manager>
              SetHandler balancer-manager
      </Location>
      ProxyPass /balancer-manager !
      ProxyPass / balancer://linuxhelp/" >> /etc/httpd/conf.d/lb.conf '
    sudo systemctl start firewalld
    EOF
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./accenture.pem")
      host        = self.public_ip
    }
  }
*/

  tags = {
    Name = "website-instance"
  }
}
resource "aws_key_pair" "mykeypair" {
  key_name   = "accenture"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5ywk5MTcBnXihu1UcB2bBgZ5Jbo8ZBPno18Ie4xSrOkUClg+fp+I1zIK28nNv3OhJ6qsM1qTomHbrJbpbtoQhKCaAvuB2IMy1+RUcVTOLHWLpUWDLhWgj6a9I+Rv7gQ4KDyHWxt3RWdHR8wu7GDh7nZ9TG2xSgE2LtBmiHhrBhkUZypqIVtHG8pMR6D3LuRzT3MGi2WRK0bv1DxKlCfwLzF1pyb8cRGRHsFHYLq+bIN58tvAzqQQde2AiHbPt0hVsDqV7znfgH5T1lKVU7bLKOOZRAO/S0eVl7cCKi5XJTuDR1TExKxXQYyQu6ErsDsScdx+O+i+tY2j64PcR+p6r"
}
