# What is Terraform?

Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure.

[Visit Terraform's website to know more](https://www.terraform.io/)

## **Tips and Tricks** ##

#### 1. TFL_LOG 

If you would like to enable log reporting, you can declare a variable in the console
`TF_LOG=1`

If you want to turn it off,`TF_LOG=0`

#### 2. tfstate

This is the file that would contain the last fetched information about the instances deployed in the last applied `batch`.


#### 3. terraform refresh

In case you would want to refresh the current terraform plan, you can use `terraform refresh <<YOUR ARGUMENTS>>`

Refresh could be needed under scenario where the tflstate file would've gotten corrupted or lost, or due to any other reason as well.

#### 4. terraform destroy

If you want to destroy the project, you can refer to the below steps:

  1. Run command `terraform plan -destroy -OUT=<<YOUR_FILENAME>>.tfplan <<YOUR ARGUMENTS>>`
        1. Log Verbose should tell you briefly on what the tasks plan will perform, i.e. destorying any droplets created, etc.
  2. Once you run the destroy command, it will generate the Terraform destroy plan in the file given as a value to the argument `-OUT`.
        1. FYI, the plan file will contain binary codes.
  4. The final step is to apply the plan which is generated in the above steps:
        1. `terraform apply <<YOUR_FILENAME>>.tfplan`
