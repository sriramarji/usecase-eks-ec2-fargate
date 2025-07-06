# ECR Repository
resource "aws_ecr_repository" "frontend" {
  name = "frontend-react-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "frontend-react-app"
  }
}

resource "aws_ecr_repository" "backend" {
  name = "backend-flask-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "backend-flask-app"
  }
}