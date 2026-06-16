resource "aws_dynamodb_table" "basic-dynamodb-table" {

    name = "amit-state-table"
    billing_mode = "pay_per_request"
    hash_key = "LockID"
  

    attribute {
      name = "LockID"
      type = "S"

    }

    tags = {
      Name = "amit-state-table"
    }
}

   