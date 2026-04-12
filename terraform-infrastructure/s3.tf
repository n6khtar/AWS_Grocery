resource "aws_s3_bucket" "avatars" {
  # Change this to something totally unique to you!
  bucket = "grocerymate-avatars-naveed-12345"

  tags = {
    Name        = "grocerymate-avatars"
    Environment = "Dev"
  }
}