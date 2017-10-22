#----------------------
# tf-aws-s3 example
#----------------------


init:
	terraform init

plan: init
	terraform plan -lock=false -out=./.terraform/terraform.tfplan

apply: init
	terraform apply -lock=false

destroy:
	terraform destroy -lock=false

clean:
	rm -rf .terraform
