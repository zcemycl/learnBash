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
#### - Simple calculation
`echo $((100/20))`

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
10. Upload folder via `aws s3 cp [FOLDER] s3://youtubefaces --recursive`. (recursive is to loop via all subfolders)
11. Remove `aws s3 rm [FILENAMEPATH]`.

#### - Set up ec2 and ssh 
** remember to set your security group.
1. Search ec2 in services. Launch instance (in my case, an ubuntu instance, so user name is 'ubuntu').
2. Download pem key file (for example, `abc.pem`).
3. Wait for the instance state to turn green. 
4. Go to your linux terminal, and navigate to your pem file directory. 
5. Command `chmod 400 abc.pem`.
6. To connect via ssh, command `ssh -i abc.pem ubuntu@[Public DNS (IPv4)]`. You can find Public DNS when you click on your launched instance in the description session.

#### - Upload files to your ec2 instance. 
1. Command `scp -i abc.pem [TARGET FILE] ubuntu@[Public DNS]`.

#### - Setup aws ubuntu machine (g4dn.4xlarge)
** remember to increase your use limit. 
1. `source activate pytorch_p36`.
2. `sudo apt-get update` and `sudo apt-get upgrade`.
3. `pip install --upgrade pip`.
4. `pip install numpy, pandas, dlib, face_recognition`.

#### - `screen` to run process remotely even when disconnected
1. `screen` or `screen -S session_name`
2. Detach from linux screen session. `Ctrl+a d`
3. Find the session ID. `screen -ls`
4. Store screen. `screen -r 10835`
5. Kill screen. `screen -X -S [session_name] quit`

#### - Better than `screen`, `tmux` is better to keep ec2 python running even when your laptop off. 
1. `ssh` your ec2 instance. 
2. `tmux new-session -s [session_name]` to start and connect to a new named session.
3. Detach from any session by. `Ctrl+B` -> `release Ctrl+B` -> `D`
4. List all active sessions. `tmux list-sessions`
5. Run your python in one of the active sessions. 
6. Detach. 
7. After logging out and in again, connect to a named session. `tmux attach-session -t [session_name]`
8. Kill the session. `tmux kill-session -t session_name`

#### - Kill nvidia-smi process
1. `nvidia-smi` or `sudo fuser -v /dev/nvidia*` to check PID that is running.
2. `sudo kill -9 [PID]` to kill the target process.
3. Reset the nvidia gpu, by `sudo nvidia-smi --gpu-reset -i 0` or without `-i 0` to reset all gpus.

#### - Rospy
+ `roslaunch <package_name> <launch_file>`
+ `roscd <package_name>`, example `roscd my_package` and `roscd std_msgs/msg/`
+ `catkin_create_pkg <package_name> <package_dependecies>`, e.g. `catkin_create my_package rospy`
+ `rospack list` list all of the packages in your ROS system
+ `cd src` and `touch simple.py` 
```python
import rospy
rospy.init_node('ObiWan')
print('Help me.')
```
+ `roscd my_package`, `mkdir launch` and `touch launch/my_package_launch_file.launch`
```
<launch>
	<!-- my_package -->
	<node pkg="my_package" type="simple.py" name="ObiWan" output="screen">
	</node>
</launch>
```
+ `catkin_make` to make package in src `catkin_make --only-pkg-with-deps my_package` (only compile one specific package)
+ `rosparam list`, `rosparam get <parameter_name>`, `rosparam set <parameter_name> <value>` ROS parameters settings and list
+ `rostopic list | grep '/counter'` counter is the variable assigned in rospy loop. 
+ `rostopic info /counter` can see the Publishers name and ip.
+ `rostopic echo /counter` will print out real-time counter data. 
+ `rosmsg show <message>` for example, `rosmsg show std_msgs/Int32`.
+ `rostopic pub /counter std_msgs/Int32 5` to print the Subscriber message
+ `rosservice list`
+ `rosservice info /name_of_service`
+ `rosservice call /the_service_name "traj_name: 'release_food'"` example.
+ `rossrv show name_of_the_package/Name_of_Service_message`
