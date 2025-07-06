terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  # Configuration options
    root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
}
}

tags = merge( var.additional_tags, {
    Name = var.ec2_config.name
    Environment = var.environment
    Application = var.application
    Owner = var.owner
  }
)
}