variable "env" {
  type = string
}

variable "lambdas" {
  type = map(object({
    s3_key   = string
    handler  = string
    runtime  = string
    layers   = optional(list(string), [])
    env_vars = optional(map(string))
  }))
}

variable "layers" {
  type = map(object({
    s3_key              = string
    compatible_runtimes = list(string)
  }))
}

variable "lambda-bucket" {
  type = string
}
