terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.64.0"  # Update this to match the provider version in your root module
    }
  }
}

resource "aws_sns_topic" "etl_notifications" {
  name = "etl-notifications-${var.env}"
    tags = var.tags
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.etl_notifications.arn
  protocol  = "email"
  endpoint  = var.notification_email
  
}
