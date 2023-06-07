#----------------------------------------------#
# compute-base: main                           #
# ./app/modules/compute-base/main.tf           #
#----------------------------------------------#


data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Key Pair
resource "aws_key_pair" "deployer" {
  key_name = "provision_key"
  # public_key = file("~/.ssh/wonder_lab.pub") # dell-wsl_key
  public_key = file("~/.ssh/terraspace_webserver_key.pub") #work-wsl_key
}

resource "aws_instance" "apache_ws" {
  ami                         = data.aws_ssm_parameter.ami_id.value
  subnet_id                   = var.public_subnet_id
  instance_type               = var.instance_type
  security_groups             = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  # user_data                   = fileexists("./files/apache_install.sh") ? file("./files/apache_install.sh") : null

  user_data = file("${path.module}/files/apache_install.sh")

  tags = {
    Name = var.apache_tag
  }
}

resource "aws_instance" "database_instance" {
  ami             = data.aws_ssm_parameter.ami_id.value
  subnet_id       = var.private_subnet_id
  instance_type   = var.instance_type
  security_groups = [var.private_security_group_id]
  # associate_public_ip_address = true
  key_name = aws_key_pair.deployer.key_name
  # user_data                   = fileexists("./files/mysql_install.sh") ? file("./files/mysql_install.sh") : null
  # user_data = file("files/mysql_install.sh")


  tags = {
    Name = var.database_tag
  }
}