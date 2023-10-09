# Terraform Beginner Bootcamp 2023 - Week 2
![week 2](assets/week2-connect.png)

## TerraTowns Provider Physical Diagram
![Physical Diagram](assets/week2-provider-physical-diagram.png)

## Anatomy of a Request
![Anatomy of a request](assets/week2-anatomy-of-a-request.png)


## Working with Ruby

### Bundler

Bundler is a package manager for ruby.
This is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file.

[source](https://rubygems.org) 

```rb
gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context.


## Terratowns Mock Server
We use a mock server to simulate the production server. Using the mock server we can deploy and trouble shoot our terraform provider. 

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

[Sinatra](https://sinatrarb.com/)

### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

The code for the server is stored in the `server.rb` file.

## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete


https://en.wikipedia.org/wiki/Create,_read,_update_and_delete

## Terraform Best Practices
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




