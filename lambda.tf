#LambdaRole
resource "aws_iam_role" "terra_lambda_role" {
  name = "terra-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

#lambda policy to write cloud watch logs
resource "aws_iam_role_policy_attachment" "terra_lambda_logs" {
  role       = aws_iam_role.terra_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "aws_s3_object" "lambda_zips" {
  for_each = var.lambdas
  bucket   = var.lambda-bucket
  key      = each.value.s3_key
}

resource "aws_lambda_layer_version" "terra_lambda_layers" {
  for_each            = var.layers
  layer_name          = each.key
  s3_bucket           = each.value.s3_key
  compatible_runtimes = each.value.compatible_runtimes
}


#lambda function
resource "aws_lambda_function" "terra_lambda_function" {
  for_each      = var.lambdas
  function_name = "${var.env}_${each.key}_lambda"
  role          = aws_iam_role.terra_lambda_role.arn

  s3_bucket = var.lambda-bucket
  s3_key    = each.value.s3_key

  runtime = each.value.runtime
  handler = each.value.handler

  layers = each.value.layers != null && length(each.value.layers) > 0 ? [
    for layer_key in each.value.layers : aws_lambda_layer_version.terra_lambda_layers[layer_key].arn
  ] : []

  environment {
    variables = each.value.env_vars
  }
}





