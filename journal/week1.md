# Terraform Beginner Bootcamp 2023 - Week 1

- [Terraform Beginner Bootcamp 2023 - Week 1](#terraform-beginner-bootcamp-2023---week-1)
  * [Root Module Structure](#root-module-structure)
  * [Terraform and Input Variables](#terraform-and-input-variables)
    + [Terraform Cloud Variables](#terraform-cloud-variables)
    + [Loading Terraform Input Variables](#loading-terraform-input-variables)
    + [var flag](#var-flag)
    + [var-file flag](#var-file-flag)
    + [terraform.tvfars](#terraformtvfars)
    + [auto.tfvars](#autotfvars)
    + [order of terraform variables](#order-of-terraform-variables)
  * [Dealing With Configuration Drift](#dealing-with-configuration-drift)
    + [What happens if we lose our state file?](#what-happens-if-we-lose-our-state-file-)
  * [Terraform Import](#terraform-import)
    + [Fix Missing Resources with Terraform Import](#fix-missing-resources-with-terraform-import)
    + [Fix Manual Configuration](#fix-manual-configuration)
    + [Fix using Terraform Refresh](#fix-using-terraform-refresh)
  * [Terraform Modules](#terraform-modules)
    + [Terraform Module Structure](#terraform-module-structure)
    + [Passing Input Variables](#passing-input-variables)
    + [Modules Sources](#modules-sources)
  * [Working with Files in Terraform](#working-with-files-in-terraform)
    + [Filepath](#filepath)
    + [Fileexists function](#fileexists-function)
    + [Filemd5](#filemd5)
    + [Path Variable](#path-variable)
  * [Terraform Locals](#terraform-locals)
  * [Terraform Data Sources](#terraform-data-sources)
  * [Working with JSON](#working-with-json)
    + [Changing the Lifecycle of Resources](#changing-the-lifecycle-of-resources)
  * [Terraform Data](#terraform-data)
  * [Provisioners](#provisioners)
    + [Local-exec](#local-exec)
    + [Remote-exec](#remote-exec)
  * [For Each Expressions](#for-each-expressions)





## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Environment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibility in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

The var-file flag enables multiple input variable values to be passed in by referencing a file that contains the values.

```-var-file```

### terraform.tvfars

This is the default file to load variables in terraform  

### auto.tfvars

This is file used to automatically load variable values for your Terraform configurations. Terraform uses variables to parameterize your infrastructure code and allow you to provide different values depending on the environment or specific use case

The format of the variables is ```variable_name = "value"```.

Example
```
region = "us-east-1"
instance_type = "t2.micro"

```

### order of terraform variables

Terraform evaluates variable in a specific order. The order of the variable evaluation is as below:

1. Environment Variables: Terraform first checks for environment variables that match the variable names
2. Terraform Configuration Files: Terraform loads values from the Terraform configuration files ```.tf```
3. Variable Definitions (.tfvars Files): Terraform will load values from variable definition files (.tfvars files)
4. Command-Line Flags: You can also set variable values directly using command-line flags when running Terraform commands. eg ```terraform apply -var="region=us-east-1"```
5. Interactive Prompts: If a variable is still unspecified after checking all the above sources, Terraform will interactively prompt you for the value when you run terraform apply or terraform plan. This is the fallback option for variables without values.

## Dealing With Configuration Drift

### What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform port but it won't work for all cloud resources. You need check the terraform providers documentation for which resources support terraform import.

## Terraform Import
This is a terraform command that allows you to import existing infrastructure resources into your Terraform state. It's a way to bring resources that were created outside of Terraform under Terraform management. When you import a resource, Terraform will start tracking it in its state, which enables you to manage and modify the resource using Terraform going forward.

```tf
terraform import RESOURCE_TYPE.NAME ID
 ```

 After running terraform import, Terraform will create a corresponding resource block in your configuration file, linking it to the existing resource with the provided ID. You can then manage and modify this resource using Terraform just like any other resource defined in your configuration.

### Fix Missing Resources with Terraform Import
You can use the command below on cli to import a resource

`terraform import aws_s3_bucket.bucket bucket-name`

Another alternative is to use `import.tf` file to have the resources you need imported.

```
# import.tf

# Define a Terraform resource block for an AWS S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = ""
  acl    = ""
  # ... other required attributes
}
```

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and delete or modifies cloud resource manually through ClickOps. 

If we run Terraform plan is with attempt to put our infrastructure back into the expected state fixing Configuration Drift

### Fix using Terraform Refresh
The terraform refresh command is used to update the state of Terraform-managed resources to match the real-world infrastructure.

It does not create or modify resources but instead retrieves the latest state of existing resources and updates the Terraform state file (```terraform.tfstate``` ) with the current attributes and status of those resources.

```sh
terraform apply -refresh-only -auto-approve
```


## Terraform Modules
This is a collection of related Terraform configurations, variables, and resources that can be used as a reusable and self-contained unit.

### Terraform Module Structure

It is recommend to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.
The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module from various places eg:
- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```


[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)


## Working with Files in Terraform
In Terraform, you can work with files, manage file content, and perform file-related operations using several techniques and data sources. Here are a few way you can do it.

- Checking for the existence of a file or directory
- Getting the file size or modification time
- Reading or writing the contents of a file
- Copying, moving, or deleting files and directories
- Expanding glob patterns


### Filepath
Reads the contents of a file at the given path and returns them as a string.

```tf
file("${path.module}/hello.txt")
Hello World
```

### Fileexists function

This is a built in terraform function to check the existence of a file.

```tf
condition = fileexists(var.error_html_filepath)
```

https://developer.hashicorp.com/terraform/language/functions/fileexists

### Filemd5

https://developer.hashicorp.com/terraform/language/functions/filemd5

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module
[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)


resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}


## Terraform Locals
This are named values that can be used within a Terraform module. They are similar to variables, but they cannot be set from outside the module. Locals are typically used to store values that are calculated or derived from other values within the module.

Locals allows us to define local variables.
It can be very useful when we need transform data into another format and have referenced a variable.

```tf
locals {
  s3_origin_id = "MyS3Origin"
}
```
[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

## Terraform Data Sources

This allows you to retrieve information about external resources such as cloud provider APIs, databases, and other Terraform configurations. 

This is useful when we want to reference cloud resources without importing them.

```tf
data "aws_caller_identity" "current" {}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```
[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON

We use the jsonencode to create the json policy inline in the hcl.

```tf
> jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

### Changing the Lifecycle of Resources

[Meta Arguments Lifcycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)


## Terraform Data
In Terraform, "data" refers to a category of configuration blocks and data sources that are used to retrieve information about existing infrastructure or external data sources. Terraform data sources allow you to query and fetch data from various external sources and use that data within your Terraform configuration

Plain data values such as Local Values and Input Variables don't have any side-effects to plan against and so they aren't valid in replace_triggered_by. You can use terraform_data's behavior of planning an action each time input changes to indirectly use a plain value to trigger replacement.

https://developer.hashicorp.com/terraform/language/resources/terraform-data

## Provisioners
Terraform provisioners are used to execute scripts or commands on a local or remote machine as part of resource creation or destruction. Provisioners can be used to bootstrap a resource, cleanup before destroy, run configuration management, etc


They are not recommended for use by Hashicorp because Configuration Management tools such as Ansible are a better fit, but the functionality exists.

[Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

### Local-exec
The local-exec provisioner is a type of provisioner used to execute arbitrary shell commands or scripts on the local machine where Terraform is running. It allows you to run local commands as part of your Terraform configuration, typically during the provisioning or management of resources.


This will execute command on the machine running the terraform commands eg. plan apply

```tf
resource "aws_instance" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}
```

https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec

### Remote-exec

This will execute commands on a machine which you target. You will need to provide credentials such as ssh to get into the machine.

```tf
resource "aws_instance" "web" {
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}
```
https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec



## For Each Expressions
This is a way to dynamically generate Terraform configuration based on a list or map of values. This can be useful for creating multiple resources that are similar, but not identical, or for creating resources based on data that is stored in a file or remote API.

For each allows us to enumerate over complex data types

```sh
[for s in var.list : upper(s)]
```

This is mostly useful when you are creating multiples of a cloud resource and you want to reduce the amount of repetitive terraform code.

[For Each Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)