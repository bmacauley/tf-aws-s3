#------------------------------------------------
# s3 bucket with default encryption set with kms key
#------------------------------------------------


init:
	terraform init

plan: init
	terraform plan -lock=false -out=./.terraform/terraform.tfplan

apply: init
	terraform apply -auto-approve -lock=false -state=./.terraform/terraform.tfstate

destroy:
	terraform destroy -force -lock=false -state=./.terraform/terraform.tfstate

output:
	terraform output -json -state=./.terraform/terraform.tfstate

clean:
	rm -rf .terraform *.tfstate *.backup
