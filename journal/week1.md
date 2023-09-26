# Terraform Beginner Bootcamp 2023 - Week 1

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

## What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform port but it won't work for all cloud resources. You need check the terraform providers documentation for which resources support terraform import.

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