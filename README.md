# AWS_autoshutdown

This repository includes a little script to shutdown automatically AWS instances if the user isn't running processes or connected. First of all, checks that there are no processes being run and, if that's not the case, also checks if there is an active ssh connection. If both of them return `FALSE`, shutdowns the instance in 15min.

The following code has to be added to the **Blank space** at the end of the **Advanced details** section:

'''

#!/bin/bash

## script for autoshutdown
## Change the USER variable content with whatever user you use. For admin AWS EC2, ubuntu is the default.

echo -e "USER=ubuntu\nSHELL=/bin/bash\n" >> /root/.bashrc
source /root/.bashrc

curl https://raw.githubusercontent.com/Josuerinho/AWS_autoshutdown/main/automatic_shutdown_AWS_EC2_instances_script_deploy.sh -o /root/.autoshtdown.sh

sudo chmod 700 /root/.autoshtdown.sh

# Cron job syntax
(echo "*/15 * * * * sudo /root/.autoshtdown.sh") | sudo crontab -

'''

