variable "env" {
  type = string
}

variable "lambdas" {
  type = map(object({
    s3_key  = string
    handler = string
    runtime = string
  }))
}

variable "lambda-bucket" {
  type = string
}
