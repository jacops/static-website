# Terraform 0.12 Docker Compose Skeleton For AWS

## Use locally

### Prerequisites

To use this repository you just need Docker and Docker Compose although it's possible to run commands within a local context of Terraform.

### Setup

1. Either run `make setup` or:
    * Create `.env` file from `.env.dist`
    * Create `docker-compose.local.yml` file from `docker-compose.local.yml.dist`

2. Populate `.env` file with basic values:
    * `ENVIRONMENT`: name of the environment to be deployed/managed
    * `AWS_ACCESS_KEY_ID`: AWS access key associated with an IAM user or role 
    * `AWS_SECRET_ACCESS_KEY`: AWS secret key associated with the access key 
    * `TERRAFORM_BACKEND_S3_BUCKET_NAME`: Name of S3 bucket for holding a state file 
    
3. Run `make` or `make build` to build a Terraform Docker image

4. Create S3 bucket for holding state files: `make backend-create`
        
### Execution

This repository contains a `Makefile`, which main purpose is to wrap `docker-compose` commands into single task.

Few tasks, that speed up development and testing:

* `make build` - build terraform docker image for local usage
* `make setup` - setup local repo for local usage
* `make backend-destroy` - destroy backend for the state files

And wrapped terraform commands:

* `make init` - initialise stack
* `make plan` - plan changes
* `make apply` - apply changes

To run other terraform commands, which are not in `Makefile`, please run:
```bash
docker-compose run --rm terraform [COMMAND]
```

## Notes

* Please don't store any secrets in state files if possible.
* Tag resources as much as possible, but don't go crazy
* Don't make stacks complex. Create a new one to simplify management of resources and reference them in other stacks when required
* Don't use default values for variables too often
