# What is Terraform?

Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure.

[Visit Terraform's website to know more](https://www.terraform.io/)

# How to execute the plan


## 1. Generate ECDSA SSH Keys

  1. You can run `ssh-keygen -t ecdsa` to generate the SSH Public/Private keys for your system
      
      ![Generate ECDSA SSH Keys](https://i.postimg.cc/13WXPKnd/Digital-Ocean-Terrform-Step-1-Generate-ECDSA-SSH-Keys-Peek-2021-04-17-09-09.gif)
     
      :pushpin: :loudspeaker: Leave the passphrase empty for password less access.

## 2. Move your Public and Private keys in your main ~/.ssh directory and Copy the public key

  1. You can use `mv my_digital_ocean_terraform_id_ecdsa* ~/.ssh` to generate transfer the generated public/private keys to your main SSH directory
      
      ![Move your Public and Private keys](https://i.postimg.cc/T3W2MXxK/Digital-Ocean-Terrform-Step-1-Copy-PUB-Key-Peek-2021-04-17-09-15.gif)
    
  2. Once you have transferred your files, do copy the public key code to use it in the next step to import into Digital Ocean.

## 3. Import generated public key into your Digital Ocean's account

  1. Click [here](https://cloud.digitalocean.com/account/security) to go to Your Digital Ocean Account's Security section and Click on "Add SSH Key" button
      
      ![Import generated public key into your Digital Ocean's account](https://i.postimg.cc/P5n06LtF/Screenshot-from-2021-04-17-09-12-45.png)

  2. Run `cat ~/.ssh/my_digital_ocean_terraform_id_ecdsa.pub` to copy and paste the generated public key into the opened "Add SSH Key" popup
      
      ![copy and paste the generated public key into the opened "Add SSH Key" popup](https://i.postimg.cc/RCRjPC3M/Digital-Ocean-Terrform-Step-1-Import-Into-DO-Peek-2021-04-17-09-20-Cropped.gif)

## 4. Generate Digital Ocean's Personal Access Token

  1. Click [here](https://cloud.digitalocean.com/account/api/tokens) to go to Your Digital Ocean's Applications & API page
      
      ![Digital Ocean - Applications & API](https://i.postimg.cc/3wGfXtT4/Screenshot-from-2021-04-17-08-48-01.png)
      
  2. Cick on "Generate Token" button and Provide the name of your token
  
      ![Generate your token](https://i.postimg.cc/C1mGk8zn/Digital-Ocean-Terrform-Step-2-Peek-2021-04-17-08-50.gif)
      
  3. Copy the Personal Access Token which you will need in the next step.
  
      ![Copy the Personal Access Token](https://i.postimg.cc/3J6P24vq/Digital-Ocean-Terrform-Step-2-Copy-SSH-Token-Peek-2021-04-17-08-53.gif)
      
     
      :pushpin: :key: :loudspeaker: Do not reveal PAT to anyone. I've deleted mine after generating. 
    
## 5. Define Variables in Console
    1. `DO_TOKEN=<<YOUR_DIGITAL_OCEAN_API_ACCESS_TOKEN>>`
    2. `SSH_FINGERPRINT=<<YOUR_DIGITAL_OCEAN_API_SSH_FINGERPRINT>>`

## 6. Setup the plan
    `terraform plan -var "jay_digitalocean_terraform_token=${DO_TOKEN}" -var "pub_key=$HOME/.ssh/terraform_digitalocean_ecsda_key.pub" -var "pvt_key=$HOME/.ssh/terraform_digitalocean_ecsda_key" -var "ssh_fingerprint=${SSH_FINGERPRINT}"`    

## 7. Execute the plan
    `terraform apply -var "jay_digitalocean_terraform_token=${DO_TOKEN}" -var "pub_key=$HOME/.ssh/terraform_digitalocean_ecsda_key.pub" -var "pvt_key=$HOME/.ssh/terraform_digitalocean_ecsda_key" -var "ssh_fingerprint=${SSH_FINGERPRINT}"`    



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
