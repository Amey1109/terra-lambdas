env = "prod"

lambdas = {
  "prod_js_with_deps" = {
    s3_key  = "js-lambda-with-deps.zip"
    runtime = "nodejs20.x"
    handler = "index.handler"
  }

  "prod_simple_js" = {
    s3_key  = "simple-js.zip"
    runtime = "nodejs20.x"
    handler = "index.handler"
  }

  "prod_simple_python" = {
    s3_key  = "simple-python.zip"
    runtime = "python3.12"
    handler = "lambda_function.lambda_handler"
  }
}

lambda-bucket = "terra-lambdas"
