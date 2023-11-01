# AWS_autoshutdown

This repository includes a little script to shutdown automatically AWS instances if the user isn't running processes or connected. First of all checkes that there are no processes being run and, if that's not the case, also checks if there is an ssh connection by the user active. If both of them return false, shutdowns the instance in 15min.
