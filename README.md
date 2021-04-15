# digitalocean-terraform
Testing out terraform on digital ocean after taking inspiration from Dave's tutoriaLinux Youtube videos.

## **Tips and Tricks** ##

#### 1. TFL_LOG 

If you would like to enable log reporting, you can declare a variable in the console
`TF_LOG=1`

If you want to turn it off,`TF_LOG=0`

#### 2. tfstat

This is the file that would contain the last fetched information about the instances deployed in the last apply `batch`.


#### 3. terraform refresh

In case you would want to refresh the current terraform plan, you can use `terraform refresh <<YOUR ARGUMENTS>>`
