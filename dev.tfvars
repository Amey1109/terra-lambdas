env = "dev"

lambdas = {
  "js_with_deps" = {
    s3_key  = "lambdas/js-lambda-with-deps.zip"
    runtime = "nodejs20.x"
    handler = "index.handler"
    layers  = ["node_common"]
  }

  "simple_js" = {
    s3_key  = "lambdas/simple-js.zip"
    runtime = "nodejs20.x"
    handler = "index.handler"
    layers  = []
    env_vars = {
      STAGE     = "dev"
      LOG_LEVEL = "DEBUG"
    }
  }

  "simple_python" = {
    s3_key  = "lambdas/simple-python.zip"
    runtime = "python3.12"
    handler = "lambda_function.lambda_handler"
  }
}

layers = {
  node_common = {
    s3_key              = "layers/node-common-layer.zip"
    compatible_runtimes = ["nodejs18.x", "nodejs20.x"]
  }
}


lambda-bucket = "terra-lambdas"
