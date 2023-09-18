# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:
Project will utilises semantic versioning for tagging based on [Semver.org](https://semver.org/)

This is the general format

Version number Example **MAJOR.MINOR.PATCH**  (`1.0.1`) 

We then increment the:
 
- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## References
### Installing Terraform CLI
We will be installing using the officially maintained and signed packages for the debian Linux distributions using the link below.


[Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Linux
Some Linux Basic that we will be using in the bootcamp

[How to check Os version and Kernel](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example
```
$ cat /etc/os-release


PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

```

#### Shebang
It tell the os what program will interpret the script

Example

For Debian Distributions

```
#!/bin/bash
```

Portable Shebang that uses Environments
```
#!/usr/bin/env bash
```
#### Execution Considerations
When executing the bash script we can use the ```./``` shorthand notiation to execute the bash script.

eg. ```./bin/install_terraform_cli ```

If we are using a script in .gitpod.yml we need to point the script to a program to interpert it.

eg. ```source ./bin/install_terraform_cli```

[Read more on Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))




#### File Permissions

[Wiki about Linux file permissions](https://en.wikipedia.org/wiki/File-system_permissions)

[Changing Linux File Permissions](https://en.wikipedia.org/wiki/Chmod)

Bash framework for managing bash configuration 
[Oh my bash](https://github.com/ohmybash/oh-my-bash)


### Gitpod
Getting Started Guide
[Introduction](https://www.gitpod.io/docs/introduction)
