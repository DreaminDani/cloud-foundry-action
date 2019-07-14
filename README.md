# GitHub Action for NPM

This Action for [pcf](https://docs.run.pivotal.io/) enables arbitrary actions with the `cf` command-line client, including pushing code to Pivotal Cloud Foundry.

## Usage

An example workflow to publish your code to PCF:

```hcl
workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Publish" {
  uses = "actions/cloud-foundry-action"
  args = "push APP_NAME"
  secrets = ["CF_USERNAME", "CF_PASSWORD"]
}
```

### Secrets

* `CF_USERNAME` - **Optional**. Authenticating user for PCF.
* `CF_PASSWORD`- **Optional**. Authenticating password for PCF.

For more info on command line authentication, see http://cli.cloudfoundry.org/en-US/cf/auth.html

### Environment variables

TBD

#### Example

To authenticate and publish to a cloud foundry instance:

```hcl
action "Publish" {
  uses = "actions/cloud-foundry-action"
  args = "push APP_NAME"
  secrets = ["CF_USERNAME", "CF_PASSWORD"]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
