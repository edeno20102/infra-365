
resource "aws_route53_zone" "main" {
  name = "365eden.com"

  tags = {
    Name = "test-zone"
  }
}

resource "aws_route53_record" "web" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "test.365eden.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.web.dns_name]
}