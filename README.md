# triangl-scripting

Collection of shell scripts to handle different tasks such as automated slack notifications


## triangl-packet-updater
Run on openWRT before starting:

```bash
opkg update
opkg install jq
opkg install curl
```

Shell script to fetch every successful build and install it on the AP. Also notifies the #hardware_updates channel about success or error of the process.

Don't forget to insert API token.

Script queries circleCI API for successful builds, if a new one is found it is downloaded and installed.

## Router IP updater
Shell scripts, that sends a notification in a slack channel if the ip address of one of our routers changes.
