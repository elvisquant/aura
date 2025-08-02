# To enable remote state, create the S3 bucket and DynamoDB table first,
# then uncomment this block and run 'terraform init'.

# terraform {
#   backend "s3" {
#     bucket         = "your-unique-terraform-state-bucket-name"
#     key            = "dev/platform/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-lock"
#   }
# }
