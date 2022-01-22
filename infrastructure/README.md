# Terraform


Configure aws profile: create `credentials` file in the `.aws` folder located in your user's root (`username/.aws/`)
```
# credentials

[aws-profile-name]
aws_access_key_id = ACCESS_KEY_ID
aws_secret_access_key = SECRET_ACCESS_KEY
```


Plan changes
```shell
./terraform.sh aws-profile-name plan
```


Apply changes
```shell
./terraform.sh aws-profile-name apply
```


Import to state
```shell
./import.sh aws-profile-name module.module-name module-id
```


Operations with state
```shell
./state.sh aws-profile-name mv 'module'.'module-name' 'module'.'module-new-name' 
```
