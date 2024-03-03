data "cloudflare_zone" "nacl30d" {
  account_id = data.cloudflare_accounts.default.accounts[0].id
  name       = var.domains.default
}

resource "cloudflare_record" "www" {
  name    = "www"
  proxied = true
  type    = "CNAME"
  value   = "officialsite.pages.dev"
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "cli" {
  name    = "cli"
  proxied = false
  type    = "CNAME"
  value   = "cli-nacl30d.netlify.app"
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "vpn" {
  name    = "vpn"
  proxied = false
  type    = "CNAME"
  value   = "salt.bf1.jp"
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "mx_1" {
  name     = var.domains.default
  priority = 10
  proxied  = false
  type     = "MX"
  value    = "mx01.mail.icloud.com"
  zone_id  = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "mx_2" {
  name     = var.domains.default
  priority = 10
  proxied  = false
  type     = "MX"
  value    = "mx02.mail.icloud.com"
  zone_id  = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "sig1_domainkey" {
  zone_id = data.cloudflare_zone.nacl30d.id
  name    = "sig1._domainkey"
  value   = "sig1.dkim.nacl30d.com.at.icloudmailadmin.com"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "txt_spf" {
  zone_id = data.cloudflare_zone.nacl30d.id
  name    = var.domains.default
  value   = "v=spf1 include:icloud.com ~all"
  type    = "TXT"
  proxied = false
}

resource "cloudflare_record" "_dmarc" {
  name    = "_dmarc"
  proxied = false
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine; rua=mailto:b8f9f3da9e2e4bafaff53078e26f2272@dmarc-reports.cloudflare.net"
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "wildcard_txt_dkim" {
  name    = "*"
  proxied = false
  type    = "TXT"
  value   = "v=DKIM1; p="
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "wildcard_txt_spf" {
  name    = "*"
  proxied = false
  type    = "TXT"
  value   = "v=spf1 -all"
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "txt_apple" {
  name    = var.domains.default
  proxied = false
  type    = "TXT"
  value   = "apple-domain=eykzwem2l9lPYNzX"
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "txt_google" {
  name    = var.domains.default
  proxied = false
  type    = "TXT"
  value   = "google-site-verification=FN-rqczwxhX-kjg83L7sDHpzVrt6SKms5EMGkEGkMm0"
  zone_id = data.cloudflare_zone.nacl30d.id
}

resource "cloudflare_record" "txt_keybase" {
  name    = var.domains.default
  proxied = false
  type    = "TXT"
  value   = "keybase-site-verification=dpu5OmeSvXqmmFFZ8Cwb0Nydg4lY-jnTtDm6sGXG3Y8"
  zone_id = data.cloudflare_zone.nacl30d.id
}
