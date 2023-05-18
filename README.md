# [Terraform](https://registry.terraform.io/    )

- Lists all resources tracked in the state.
```
terraform state list
```
#
- Removes a resource from the state file.
```
terraform state rm < aws_internet_gateway.gw >
```
#
- Moves a resource from one state address to another.
    - t's useful when you need to update the state file after refactoring your Terraform configuration or when you want to change the address of a resource.
```
terraform state mv aws_internet_gateway.[old-name] aws_internet_gateway.[new-name]
```
#
- Displays detailed information about a resource in the state.
```
terraform state show < aws_vpc.main >
```
#
- Retrieves the current state and saves it to a local file.
```
terraform state pull > terraform2.tfstate
```
#
- Imports an existing resource into the state file.
```
terraform import < aws_internet_gateway.gw > < igw-0eb0f3d36e2194d11 >
```
#
- Updates the state file with the latest information from the infrastructure.
```
terraform refresh
```
#
- Releases the lock on the state file.
```
terraform state unlock < id >
```
#
- Pushes the local state to the configured remote backend.
```
terraform state push
```
- Here's an example of using the terraform state push command to push the local state to a remote backend:
    - Configure your Terraform backend to use a remote backend, such as an S3 bucket or a remote state storage service. Update your Terraform configuration file (e.g., backend.tf) with the appropriate backend configuration.
    - Initialize the Terraform configuration by running the following command in the directory containing your Terraform configuration files: `terraform init` . This will initialize the backend and download any necessary provider plugins.
    - Make sure you have made changes to your local state that you want to push to the remote backend. For example, you might have created or modified resources using Terraform.
    - Run the `terraform state push` command to push the local state to the remote backend. This command will upload your local state file to the configured remote backend.

