action "cf-cli" {
  uses = "./"
}

workflow "Example" {
  on = "push"
  resolves = ["Show orgs in PCF"]
}

action "Show orgs in PCF" {
  uses = "./"
  args = "orgs"
  secrets = ["CF_USERNAME", "CF_PASSWORD"]
}
