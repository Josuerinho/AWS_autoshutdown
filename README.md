## AWS_autoshutdown

This repository includes a little script to shutdown automatically AWS instances if the user isn't running processes or connected. First of all, checks that there are no processes being run and, if that's not the case, also checks if there is an active ssh connection. If both of them return `FALSE`, shutdowns the instance in 15min.

The following code has to be added to the **Blank space** at the end of the **Advanced details** section:

```
#!/bin/bash

## script for autoshutdown
## Change the username variable content with whatever user you use. For admin AWS EC2, ubuntu is the default.

username=ubuntu

echo -e "username=$username\nSHELL=/bin/bash\n" >> /home/$username/.bashrc
source /home/$username/.bashrc

curl https://raw.githubusercontent.com/Josuerinho/AWS_autoshutdown/main/automatic_shutdown_AWS_EC2_instances_script_deploy.sh -o /home/$username/.autoshutdown.sh

sudo chmod 700 /home/$username/.autoshutdown.sh

# Cron job syntax
(echo "*/15 * * * * sudo /home/$username/.autoshutdown.sh" &> /dev/null) | sudo crontab -

```

