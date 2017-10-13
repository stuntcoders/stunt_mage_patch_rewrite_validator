# Magento Patch Rewrite Validator

Simple shell script to detect any overwritten patched files in local/community code pool and in custom themes

## Install
```sh
curl https://raw.githubusercontent.com/stuntcoders/stunt_mage_patch_rewrite_validator/master/mage-patch-check.sh -O
mv mage-patch-check.sh /usr/local/bin/mage-patch-check
chmod +x /usr/local/bin/mage-patch-check
```

## Usage
Navigate to magento proeject, apply patch and run:
```sh
$ mage-patch-check
```

## Example ouput
![Example output](https://s3-eu-west-1.amazonaws.com/stcd/stunt_mage_patch_rewrite_validator/mage-patch-check-output.png)