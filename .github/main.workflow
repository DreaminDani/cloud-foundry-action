action "cf-cli" {
  uses = "./cf-cli/"
}

workflow "Example" {
  on = "push"
  resolves = ["Show orgs in PCF"]
}

action "Show orgs in PCF" {
  uses = "./cf-cli"
  args = "orgs"
  secrets = ["CF_USERNAME", "CF_PASSWORD"]
}
