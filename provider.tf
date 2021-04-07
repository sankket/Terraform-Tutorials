# Set AWS as a provider

provider "aws" {
  profile    = "default"
  region     = "eu-west-1"
}

#here we are telling terraform that we need to interact with aws.
