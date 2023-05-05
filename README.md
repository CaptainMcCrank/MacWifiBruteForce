# MacWifiBruteForce
A MacOS solution for brute forcing a wifi credential


This is intended to be used with the [HackThisWifi project](https://hackthiswifi.patrickmccanna.net)

## Script Overview

This script reads a passwords list.  

It uses the following terminal command to attempt to wifi network connections:

```
networksetup -setairportnetwork en0 $ssid $password 
```
Learn about other Mac Networking commands [here](https://gist.github.com/jjnilton/add1eeeb3a9616f53e4c)
  
Next, we check to see what [SSID](https://en.wikipedia.org/wiki/Service_set_(802.11_network)) our system is currently attached to with the following command:

```
networksetup -getairportnetwork en0 | awk -F": " '{print $2}'
```
If our SSID is 'HackThisWifi', we got on!  The script will report the password that worked.


This script expects a passwords.txt file in the working directory of the script.  

I leave it as an exercise for the reader to locate their own passwords lists, but I've included a sample dummy file with a limited number of passwords



# Running the Brute Forcer
```
./MacWifiBruteForcer.sh
```


## Install Git

[Install Git](https://www.github.com/git-guides/install-git)

## Create your hacking directory:

```
mkdir hacking
```
## change directories into the hacking directory:
```
cd hacking
```
## clone the repository:
```
git clone https://github.com/CaptainMcCrank/WinWifiBruteForce.git  
```
[Install Git](https://www.github.com/git-guides/install-git)

You might find this video helpful on the [git clone](https://youtu.be/aHMPn57ZmJo) command.




# FAQ
1. What did you learn while writing this script?

Checking the output of a command that is sent to a variable is finicky.  Reduce your output to only what you need through pipes & greps.  

Besure to look at the output of $? after a networksetup command is run- sometimes it spits data out to stderr even though the command ran correctly.  