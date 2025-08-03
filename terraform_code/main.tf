#Created by CloudMan on August 3, 2025 07:38 PM - UTC
terraform { 
   required_providers { 
      aws =  { 
         source  =  "hashicorp/aws"
      } 
    } 
}

provider aws{ 
    region  =  "us-east-1" 
     shared_credentials_files  =  ["C:/Users/Usuario/Documents/Terraform/RecursosTerraform/credentials.txt"]
}

terraform {
     backend "s3" {
          bucket          =  "s3-cloudman-terraform-backend-cm3"
          key             =  "states/StateSNS/StateSNS.tfstate"
          region          =  "us-east-1"
          dynamodb_table  =  "TerraformBackend-cm3"
     }
}

resource "aws_sns_topic" "Topic"{
   tracing_config = "PassThrough"
   tags  =  {
      Name = "Topic"
   }
   name = "Topic"
}
