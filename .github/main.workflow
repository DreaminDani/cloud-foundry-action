action "cf-cli" {
  uses = "./cf-cli/"
}

workflow "Example" {
  on = "push"
  resolves = ["Deploy to PCF"]
}

action "Deploy to PCF" {
  uses = "./cf-cli"
  args = "Hello World"
}
