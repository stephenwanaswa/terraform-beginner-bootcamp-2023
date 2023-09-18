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

## Terraform Basics

### Terraform Registry
Terraform Sources their providers and modules fron te Terraform Registry which is located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** are interfaces to APIs that will allows you to create resources in terraform e.g. [Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest)

- **Modules**  are a way to make larger amount of terrraform code modular, portable and shareable


### Terraform Console
We can see a list of all terraform command by typing ```terraform```

#### Terraform Init
```terraform init```

At the start of a new terraform project we will run ```terraform init``` to download the binaries for the terraform provider that we will use for this project.

#### Terraform Plan
```terraform plan```

Generates out a changeset about the state of our infrastructure and what will be changed. The output can be passed to an apply, but not always necessary.

#### Terraform Apply
```terraform apply```

This will run a plan and pass the changeset to be executed by terrraform. Apply prompt a Yes or no . You can also use the auto approve flag to skip this ```terraform apply --auto-approve```

#### Terrraform Lock Files
```terraform.lock.hcl```

This contains the locked versioning for the providers or modulues that should be used with this project.

The Terraform Lock File should be committed to your Version Control System (VSC) eg. Github

#### Terraform State Files
```.terraform.tfstate ```

This contain information about the current state of your infrastructure.

This file should not be commited to your VCS.

This file can contain sensintive data.

If you lose this file, you lose knowning the state of your infrastructure.

.terraform.tfstate.backup is the previous state file state.

#### Terraform Directory

```.terraform ```

The directory contains binaries of terraform providers.


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

## Working Env Vars
### env command
We can list out all Enviroment Variables (Env Vars) using the ```env``` command

We can filter specific env vars using grep eg. ```env | grep AWS_```

### Setting and Unsetting Env Vars
In the terminal we can set using ```export HELLO='world```

In the terrminal we unset using ```unset HELLO```

We can set an env var temporarily when just running a command

HELLO='world' ./bin/print_message
Within a bash script we can set env without writing export eg.

``` 
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```
### Printing Vars
We can print an env var using echo eg. ```echo $HELLO```

### Scoping of Env Vars
When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. ```.bash_profile```

### Persisting Env Vars in Gitpod
We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```gp env HELLO='world'```

All future workspaces launched will set the env vars for all bash terminals opened in thoes workspaces.

You can also set en vars in the .gitpod.yml but this can only contain non-senstive env vars.

## AWS CLI installation
AWS CLI is installed for the project via bash script
[./bin/install_aws_cli](./bin/install_aws_cli)

[Getting Started AWS CLI install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)


[AWS CLI env](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

Example of an AWS CLI command

Check logged in user

```sh
aws sts get-caller-identity

```
