# GitHub Action for PCF

This Action for [pcf](https://docs.run.pivotal.io/) enables arbitrary actions with the `cf` command-line client, including pushing code to Pivotal Cloud Foundry.

## Usage

An example workflow to publish your code to PCF:

```hcl
workflow "Deploy to PCF after build" {
  resolves = ["Deploy to PCF"]
  on = "push"
}

action "Deploy to PCF" {
  uses = "d3sandoval/cloud-foundry-action@1.1.1"
  secrets = ["CF_USERNAME", "CF_PASSWORD"]
  env = {
    CF_TARGET_ORG = "my-org"
    CF_TARGET_SPACE = "development"
  }
  args = "push APP_NAME"
}

```

### Secrets

* `CF_USERNAME` - **Optional**. Authenticating user for PCF.
* `CF_PASSWORD`- **Optional**. Authenticating password for PCF.

For more info on command line authentication, see http://cli.cloudfoundry.org/en-US/cf/auth.html

### Environment variables

* `CF_API` - **Optional**. Target api url (see http://cli.cloudfoundry.org/en-US/cf/api.html)
* `CF_TARGET_ORG`- **Optional**. Targeted org (see http://cli.cloudfoundry.org/en-US/cf/target.html)
* `CF_TARGET_SPACE`- **Optional**. Targeted space (see http://cli.cloudfoundry.org/en-US/cf/target.html)

#### Example

To authenticate and publish to a cloud foundry instance:

```hcl
action "Deploy to PCF" {
  uses = "d3sandoval/cloud-foundry-action@1.1.1"
  secrets = ["CF_USERNAME", "CF_PASSWORD"]
  env = {
    CF_TARGET_ORG = "my-org"
    CF_TARGET_SPACE = "development"
  }
  args = "push APP_NAME"
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
