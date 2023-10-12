# WEEK -3 SUMMARY
This is a summary of the activities we did during the bootcamp. 

- [WEEK -3 SUMMARY](#week--3-summary)
  * [Deploying using Terraform Steps](#deploying-using-terraform-steps)
    + [1. Resource Definitions](#1-resource-definitions)
    + [2. Provider Configuration](#2-provider-configuration)
    + [3. Resource Configuration](#3-resource-configuration)
    + [4. Terraform Init](#4-terraform-init)
    + [5. Terraform Plan](#5-terraform-plan)
    + [6. Terraform Apply](#6-terraform-apply)
    + [7. State Management](#7-state-management)
    + [8. Output Variables](#8-output-variables)
    + [9. Version Control](#9-version-control)
    + [10. Automation](#10-automation)
    + [11. Error Handling and Monitoring](#11-error-handling-and-monitoring)
    + [12. Compliance and Security](#12-compliance-and-security)
    + [13. Scaling and Updates](#13-scaling-and-updates)
    + [14. Collaboration](#14-collaboration)
  * [Making a provider Summary](#making-a-provider-summary)
    + [1. Environment Setup:](#1-environment-setup-)
    + [2. Provider Project Structure:](#2-provider-project-structure-)
    + [3. Provider Configuration:](#3-provider-configuration-)
    + [4. Provider Package:](#4-provider-package-)
    + [5. Resource and Data Source Definitions:](#5-resource-and-data-source-definitions-)
    + [6. Resource CRUD Operations:](#6-resource-crud-operations-)
    + [7. Resource State Management:](#7-resource-state-management-)
    + [8. Authentication and Configuration:](#8-authentication-and-configuration-)
    + [9. Provider Factory Function:](#9-provider-factory-function-)
    + [10. Unit Tests:](#10-unit-tests-)
    + [11. Documentation:](#11-documentation-)
    + [12. Provider Registration:](#12-provider-registration-)
    + [13. Publish and Distribute:](#13-publish-and-distribute-)
    + [14. Updates and Maintenance:](#14-updates-and-maintenance-)
    + [15. Community and Support:](#15-community-and-support-)
  * [Terraform Security Best Practices](#terraform-security-best-practices)
    + [Credential and Access Management:](#credential-and-access-management-)
    + [Configuration and State Management:](#configuration-and-state-management-)
    + [Module and Provider Security:](#module-and-provider-security-)
    + [Monitoring and Incident Response:](#monitoring-and-incident-response-)
    + [Compliance and Disaster Recovery:](#compliance-and-disaster-recovery-)
    + [Infrastructure Review and Updates:](#infrastructure-review-and-updates-)


## Deploying using Terraform Steps
Infrastructure as Code (IaC): With Terraform, infrastructure is defined as code in HCL (HashiCorp Configuration Language). You write Terraform configuration files that specify the desired resources, their attributes, and relationships in a declarative manner.

[Week 1](/journal/week1.md)

### 1. Resource Definitions
You define the types of resources you want to create, such as virtual machines, databases, networks, or storage accounts. Terraform supports a wide range of providers that allow you to manage resources across various cloud providers and services.

### 2. Provider Configuration
You configure the specific provider(s) you want to use in your Terraform configuration. This includes specifying authentication credentials, region settings, and other provider-specific details.

### 3. Resource Configuration
For each resource, you define its attributes, settings, and dependencies. You can also parameterize your configurations to make them more flexible and reusable.

### 4. Terraform Init
Before deploying resources, you run ```terraform init ``` to initialize your working directory. This command downloads provider plugins and sets up the backend configuration. This step is typically executed only once or when you make changes to your configuration.

### 5. Terraform Plan
You execute ```terraform plan``` to generate an execution plan. Terraform examines the current state and the desired state (as defined in your configuration files) and determines the actions required to achieve the desired state. This plan is a safety check to ensure you understand the changes that Terraform will make.

### 6. Terraform Apply
Once you're satisfied with the execution plan, you run ```terraform apply``` to apply the changes. Terraform then creates, updates, or deletes resources as needed, ensuring that the infrastructure matches your desired state.

### 7. State Management
Terraform maintains a state file that records the current state of the infrastructure. This state file is used to track resource attributes and relationships, allowing Terraform to make changes intelligently. Ensure that this state file is stored securely.

### 8. Output Variables
You can define output variables to retrieve information about the resources you've created. These variables can be used for scripting, automation, or sharing information with other parts of your infrastructure.

### 9. Version Control
It's best practice to use version control systems like Git to track changes to your Terraform configurations. This enables collaboration, code review, and history tracking.

### 10. Automation
Terraform supports automation through scripting and Continuous Integration/Continuous Deployment (CI/CD) pipelines, making it suitable for integrating infrastructure provisioning into your software development workflows.

### 11. Error Handling and Monitoring
Monitor the execution of Terraform commands for any errors or issues. Set up alerting and logging for critical infrastructure changes and incidents.

### 12. Compliance and Security
Ensure that your Terraform configurations and the infrastructure they create comply with security standards and organizational policies.

### 13. Scaling and Updates 
As your infrastructure evolves, you can update Terraform configurations to accommodate changes. You can also scale your infrastructure by adding more resources or making configuration changes.

### 14. Collaboration
Terraform encourages collaboration among team members, enabling multiple people to work on the same infrastructure codebase and share changes through version control systems.



## Making a provider Summary
[Week 2 Activities](/journal/week2.md)


### 1. Environment Setup:

Ensure you have Go installed, as most Terraform providers are written in Go.
Set up a Go development environment, including the installation of the Go compiler and tools.

### 2. Provider Project Structure:

Create a directory structure for your provider project. A typical project structure might include directories for source code, tests, and documentation.

### 3. Provider Configuration:

Define the configuration settings and options that your provider will need, such as authentication credentials, endpoint URLs, and other necessary information.

### 4. Provider Package:

Create a Go package for your provider. This package will include the code for creating and managing resources.


### 5. Resource and Data Source Definitions:

Define the types of resources and data sources that your provider will support. Create Go structs to represent these resource types and their attributes.

### 6. Resource CRUD Operations:

Implement the methods for creating, reading, updating, and deleting resources. These methods should interact with the target infrastructure's API or services.

### 7. Resource State Management:

Develop logic for reading and writing the state of resources. This includes methods for saving resource configurations and for reading the current state from the Terraform state.

### 8. Authentication and Configuration:

Create mechanisms for handling authentication and configuration. For example, you might provide methods to read and validate API keys, access tokens, or other credentials.

### 9. Provider Factory Function:

Define a factory function that returns an instance of the Terraform provider. This function should set up the provider configuration and resources.

### 10. Unit Tests:

Write unit tests to ensure that the provider functions as expected. Use the Terraform plugin SDK's testing framework for provider testing.

### 11. Documentation:

Create documentation that describes how to use your provider, including configuration settings, available resources, and examples of Terraform configurations.

### 12. Provider Registration:

Register your provider with Terraform by adding an entry to the Terraform Provider Registry. You'll need to provide details about your provider, including its name, version, and documentation.

### 13. Publish and Distribute:

Distribute your provider by making it available for installation through the Terraform CLI. You can publish your provider on the Terraform Registry or through other distribution channels.

### 14. Updates and Maintenance:

Continue to maintain and update your provider as needed. Respond to community feedback and address issues and feature requests.

### 15. Community and Support:

Engage with the Terraform community to provide support, gather feedback, and collaborate with users and contributors

## Terraform Security Best Practices
Some of the security best practices to note are as follows

### Credential and Access Management:
- Secure Credential Management
- Least Privilege Principle
- Protect Access Keys
- Use Instance Roles and Managed Identities

### Configuration and State Management:
- Use Remote State Storage
- Secure State Files
- Enable TLS for Communication
- Audit and Version Control
- Infrastructure as Code (IaC) Review

### Module and Provider Security:
- Verify Sources of Providers and Modules
- Implement Input Validation
- Use Dynamic Secrets for Credentials

### Monitoring and Incident Response:
- Monitoring and Logging
- Resource Tagging for Tracking
- Enable Security Logging and Alerts
- Security Awareness Training

### Compliance and Disaster Recovery:
- Adhere to Compliance Standards
- Implement Backup and Disaster Recovery

### Infrastructure Review and Updates:
- Regularly Review IaC
- Keep Terraform and Plugins Updated




