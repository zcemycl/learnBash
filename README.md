### Introduction
One of the advantages of coding, in MacOS or Ubuntu -- Unix-based system, is that you can control your workflow via terminal. And to store your repetitive commands, programmers usually use bash/shell script. This repo acts as notes for bash functions. 

#### - Run bash (.sh) script 
1. `. <name>.sh`.
#### - Header of the script
1. `#!/bin/bash`
#### - Varialble
Everything is a string in shell. SO can define any variable.
1. `var=1000` `dir=/home/User1/Documents`
2. To use the variable, please add the $ sign before it, for example, change directory to dir `cd $dir`.
#### - for loop
```
for item in items 
do 
	<cmd>
done
```

#### - if else statement
```
if [[ condition  ]]
then 
	<cmd>
else
	<cmd>
fi
```

#### - Run c++ via g++
1. `g++ main.cpp -o output`
2. `./output`

#### - Kill process on GPU
`nvidia-smi | grep 'python' | awk '{ print $3 }' | xargs -n1 kill -9`

#### - Search your pi in the same wifi
1. `ifconfig | grep inet`
2. `nmap -sP 192.168.1.0/24`
3. `ssh pi@IPAddress`

#### - Fix no sound in dell inspiron-7590 with ubuntu system
1. `sudo vim /etc/default/grub`
2. Find GRUB_CMDLINE_LINUX_DEFAULT and add snd_hda_intel.dmic_detect=0 to the end of it. (ex: `GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 snd_hda_intel.dmic_detect=0"`)
3. `sudo grub-mkconfig -o /boot/grub/grub.cfg`
4. Reboot the system.

#### - Set up aws and upload folder/files to s3
1. Set up an aws account. 
2. Click your profile and its 'My Security Credentials'.
3. Click the session 'Access keys (access key ID and secret access key)' and 'Create New Access Key'. Please download the keys.
4. Click Services and search S3. 
5. Create a bucket in S3. (For example, I created youtubefaces)
6. In your terminal, `pip install awscli` `pip install boto3`.
7. Configure your credential by `aws configure`. Enter your aws keys from step 3. 
8. List the content of your bucket. `aws s3 ls s3://youtubefaces`.
9. Upload files via `aws s3 cp [FILENAME] s3://youtubefaces`.
10. Upload folder via `aws s3 cp [FOLDER] s3://youtubefaces`.



