terraform {
  required_providers {
    pinecone = {
      source = "pinecone-io/pinecone"
    }
  }
}

provider "pinecone" {
  # api_key = set via PINECONE_API_KEY env variable
}

resource "pinecone_index" "test" {
  name = "tftestindex"
  dimension = 10
  spec = {
    serverless = {
      cloud  = "aws"
      region = "us-west-2"
    }
  }
}

data "pinecone_index" "test" {
  name = pinecone_index.test.name
}
