- [Semantic Versioning :mage:](#semantic-versioning--mage-)
- [Linux Basics](#linux-basics)
  * [Bash Scripting](#bash-scripting)
    + [Shebang](#shebang)
  * [Execution Considerations](#execution-considerations)
  * [File Permissions](#file-permissions)
- [Gitpod](#gitpod)
  * [Task Execution order](#task-execution-order)
  * [Working Env Vars](#working-env-vars)
    + [env command](#env-command)
    + [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
  * [Printing Vars](#printing-vars)
  * [Scoping of Env Vars](#scoping-of-env-vars)
  * [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
- [Github Workflow](#github-workflow)
- [Git Basics](#git-basics)
  * [Git Status](#git-status)
  * [Git Branch](#git-branch)
  * [Git Checkout](#git-checkout)
  * [Git Commit](#git-commit)
  * [Git Stash](#git-stash)
  * [Git Tag](#git-tag)
- [AWS CLI installation](#aws-cli-installation)
- [Terraform Basics](#terraform-basics)
  * [Terraform Registry](#terraform-registry)
  * [Installing Terraform CLI](#installing-terraform-cli)
  * [Terraform Console](#terraform-console)
    + [Terraform Init](#terraform-init)
    + [Terraform Plan](#terraform-plan)
    + [Terraform Apply](#terraform-apply)
    + [Terraform Destroy](#terraform-destroy)
    + [Terrraform Lock Files](#terrraform-lock-files)
    + [Terraform State Files](#terraform-state-files)
    + [Terraform Directory](#terraform-directory)
- [Issues with Terraform Cloud Login and Gitpod Workspace](#issues-with-terraform-cloud-login-and-gitpod-workspace)
  * [Terraform bash Script Login](#terraform-bash-script-login)




## Semantic Versioning :mage:
Project will utilises semantic versioning for tagging based on [Semver.org](https://semver.org/)

This is the general format

Version number Example **MAJOR.MINOR.PATCH**  (`1.0.1`) 

We then increment the:
 
- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Linux Basics

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
### Bash Scripting
A bash script is a file containing a sequence of commands that are executed by the bash program line by line. It allows you to perform a series of actions, such as navigating to a specific directory, creating a folder, and launching a process using the command line.

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
### Execution Considerations
When executing the bash script we can use the ```./``` shorthand notation to execute the bash script.

eg. ```./bin/install_terraform_cli ```

If we are using a script in .gitpod.yml we need to point the script to a program to interpert it.

eg. ```source ./bin/install_terraform_cli```

[Read more on Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))


### File Permissions

[Wiki about Linux file permissions](https://en.wikipedia.org/wiki/File-system_permissions)

[Changing Linux File Permissions](https://en.wikipedia.org/wiki/Chmod)

Bash framework for managing bash configuration 
[Oh my bash](https://github.com/ohmybash/oh-my-bash)


## Gitpod
Getting Started Guide
[Introduction](https://www.gitpod.io/docs/introduction)

### Task Execution order
(before, init, command)

With Gitpod, you have the following three types of tasks:

- before: Use this for tasks that need to run before init and before command. For example, customize the terminal or install global project dependencies.
- init: Use this for heavy-lifting tasks such as downloading dependencies or compiling source code.
- command: Use this to start your database or development server.



### Working Env Vars
#### env command
We can list out all Enviroment Variables (Env Vars) using the ```env``` command

We can filter specific env vars using grep eg. ```env | grep AWS_```

#### Setting and Unsetting Env Vars
In the terminal we can set using ```export HELLO='world```

In the terminal we unset using ```unset HELLO```

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

## Github Workflow
This is the workflow we have adapted for the bootcamp

![Workflow](/journal/assets/Githubworkflow.png)

## Git Basics
### Git Status
Show the working tree status

```git status```


### Git Branch
To see local branches, run this command:
```git branch```

NOTE: The current local branch will be marked with an asterisk (*).

### Git Checkout
Switch branches or restore working tree files

Run this command (replacing my-branch-name with whatever name you want):
``` git checkout -b my-branch-name``` 

### Git Commit
Record changes to the repository

```git commit``` 

### Git Stash
Stash the changes in a dirty working directory away

```git stash```


Save the stash
```git stash save```

Apply the stash on a new branch.

First switch to the branch using the checkout command the run the command below

```git stash apply ```

### Git Tag
Ability to tag specific points in a repository’s history as being important.

``` git tag 0.0.1 ```

Push the tag to the repository

```git push --tags ```



[Git Documentation](https://git-scm.com/docs)


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


## Terraform Basics
HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share.

### Terraform Registry
Terraform Sources their providers and modules fron te Terraform Registry which is located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** are interfaces to APIs that will allows you to create resources in terraform e.g. [Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest)

- **Modules**  are a way to make larger amount of terrraform code modular, portable and shareable

### Installing Terraform CLI
We will be installing using the officially maintained and signed packages for the debian Linux distributions using the link below.


[Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


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

#### Terraform Destroy
```teraform destroy ```

This will destroy resources created.

You can also use the auto approve flag to skip the approve prompt eg. ```terraform apply --auto-approve```

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

## Issues with Terraform Cloud Login and Gitpod Workspace

When attempting to run `terraform login` it will launch bash a wiswig view to generate a token. However it does not work expected in Gitpod VsCode in the browser.

The workaround is manually generate a token in Terraform Cloud

```
https://app.terraform.io/app/settings/tokens?source=terraform-login
```

Then create open the file manually here:

```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
open /home/gitpod/.terraform.d/credentials.tfrc.json
```

Provide the following code (replace your token in the file):

```json
{
  "credentials": {
    "app.terraform.io": {
      "token": "YOUR-TERRAFORM-CLOUD-TOKEN"
    }
  }
}
``````

### Terraform bash Script Login
Added a bash script to automate the Terraform Cloud login [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials)


